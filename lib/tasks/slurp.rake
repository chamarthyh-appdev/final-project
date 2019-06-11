namespace :slurp do
  desc "TODO"
  task case_migrate: :environment do
    
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "kcc_ruby_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
      c = Casebank.new
      c.title = row["title"]
      c.difficulty = row["difficulty"]
      c.is_brainstorm = row["is_brainstorm"]
      c.num_exhibits = row["num_exhibits"]
      c.casebook_id = row["casebook_id"]
      c.is_math_heavy = row["is_math_heavy"]
      c.case_type = row["case_type"]
      c.industry = row["industry"]
      c.is_interviewer_led = row["interviewer_led"]
      c.save
      puts "#{c.title} saved"
      end    
  end

end
