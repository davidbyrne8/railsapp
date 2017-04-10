json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :dob, :address, :phoneno, :injury
  json.url patient_url(patient, format: :json)
end
