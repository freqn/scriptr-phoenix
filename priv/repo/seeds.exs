alias Scriptr.Repo
alias Scriptr.Accounts
alias Accounts.Location
alias Accounts.Patient
alias Accounts.Pharmacy
alias Accounts.Prescription


Repo.insert!(%Pharmacy{name: "Alfa Pharmacy", username: "alfa", encrypted_password: "testpass"})
Repo.insert!(%Pharmacy{name: "Bravo Pharmacy", username: "bravo", encrypted_password: "testpass"})

Repo.insert!(%Location{latitude: "39.9612", longitude: "82.9988"})
Repo.insert!(%Location{latitude: "40.9612", longitude: "72.9988"})

# Repo.insert!(%Prescription{name: "Allegra"})
# Repo.insert!(%Prescription{name: "Rolaids"})

# Repo.insert!(%Patient{first_name: "First", last_name: "User"})
# Repo.insert!(%Patient{first_name: "Second", last_name: "User"})