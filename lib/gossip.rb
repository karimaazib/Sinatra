require 'bundler'
Bundler.require

require 'csv'
class Gossip#cette classe represente un gossip définie par son auteur et son contenu


    attr_accessor :author, :content
    def initialize(author, content)
        @author = author
        @content = content 
    end

    def save # on enregistre dans un fichier csv
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]    
        end
    end 

    def self.all
          all_gossips = [] # on initialise un array vide
          CSV.read("./db/gossip.csv").each do |csv_line|# va chercher chacune des lignes du csv do
                all_gossips << Gossip.new(csv_line[0], csv_line[1])# crée un gossip avec les infos de la ligne
          end
          return all_gossips#on retourne un array rempli d'objets Gossip
    end

    def self.find(id) 
        this_gossip = []    
            CSV.read("./db/gossip.csv").select.with_index do |line, i|   
          this_gossip << Gossip.new(line[0], line[1]) if id.to_i == i  
           end
      return this_gossip
    end
end 