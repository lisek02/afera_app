require 'factory_girl_rails'
groups = {"Autorzy audycji" => "Poszukujący dla Was nietypowych wrażeń dźwiękowych i słownych.",
					"Prezenterzy" => "Perliste i aksamitne głosy budzące Was o poranku i dające chęć do życia w ciągu dnia to właśnie oni.",
					"Promocja i reklama" => "Jesteśmy w radiu dla naszych SŁUCHACZY",
					"Realizatorzy emisyjni" => "Zasiadają w centrum sterowania. Wśród mrugających lampek, przycisków, pokrętełek i suwaczków czują się jak bogowie.",
					"Realizatorzy studia nagrań" => "To ludzie zajmujący się realizacją dźwięku w studiu nagrań. Nagrywają i sklecają w jedną całość reklamy, jingle i wszystkie inne dźwięki.",
					"Redaktorzy kulturalni" => "To kilka zaangażowanych osób, które są jednocześnie reporterami, lektorami serwisów kulturalnych oraz prezenterami.",
					"Redaktorzy muzyczni" => "To grupa ludzi odpowiedzialnych za wywiady z muzykami, relacje koncertowe i dostarczanie najświeższych niusów ze świata muzyki.",
					"Reporterzy informacyjni" => "Nieustraszeni śmiałkowie, którzy zamiast wtykać kij w mrowisko",
					"Reporterzy sportowi" => "Aferzyści interesują wszystkimi dziedzinami sportu.",
					"Technika" => "Pieczara techniczna to sanktuarium, do którego dostęp mają nieliczni i która kryje tajemnice niepojęte dla zwykłych zjadaczy chleba.",
					}

namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do

		40.times do
			FactoryGirl.create :user
		end

		User.create!(login: "admin", email: "admin@example.com", password: "password", admin: true)

		groups.each do |key, value|
			Group.create!(name: key, description: value)
		end
	end
end