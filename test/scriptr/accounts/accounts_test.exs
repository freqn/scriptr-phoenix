# defmodule Scriptr.AccountsTest do
#   use Scriptr.DataCase

#   alias Scriptr.Accounts

#   describe "pharmacies" do
#     alias Scriptr.Accounts.Pharmacy

#     @valid_attrs %{encrypted_password: "some encrypted_password", name: "some name", username: "some username"}
#     @update_attrs %{encrypted_password: "some updated encrypted_password", name: "some updated name", username: "some updated username"}
#     @invalid_attrs %{encrypted_password: nil, name: nil, username: nil}

#     def pharmacy_fixture(attrs \\ %{}) do
#       {:ok, pharmacy} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Accounts.create_pharmacy()

#       pharmacy
#     end

#     test "list_pharmacies/0 returns all pharmacies" do
#       pharmacy = pharmacy_fixture()
#       assert Accounts.list_pharmacies() == [pharmacy]
#     end

#     test "get_pharmacy!/1 returns the pharmacy with given id" do
#       pharmacy = pharmacy_fixture()
#       assert Accounts.get_pharmacy!(pharmacy.id) == pharmacy
#     end

#     test "create_pharmacy/1 with valid data creates a pharmacy" do
#       assert {:ok, %Pharmacy{} = pharmacy} = Accounts.create_pharmacy(@valid_attrs)
#       # assert pharmacy.encrypted_password == "some encrypted_password"
#       assert pharmacy.name == "some name"
#       assert pharmacy.username == "some username"
#     end

#     test "create_pharmacy/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Accounts.create_pharmacy(@invalid_attrs)
#     end

#     test "update_pharmacy/2 with valid data updates the pharmacy" do
#       pharmacy = pharmacy_fixture()
#       assert {:ok, %Pharmacy{} = pharmacy} = Accounts.update_pharmacy(pharmacy, @update_attrs)
#       # assert pharmacy.encrypted_password == "some updated encrypted_password"
#       assert pharmacy.name == "some updated name"
#       assert pharmacy.username == "some updated username"
#     end

#     test "update_pharmacy/2 with invalid data returns error changeset" do
#       pharmacy = pharmacy_fixture()
#       assert {:error, %Ecto.Changeset{}} = Accounts.update_pharmacy(pharmacy, @invalid_attrs)
#       assert pharmacy == Accounts.get_pharmacy!(pharmacy.id)
#     end

#     test "delete_pharmacy/1 deletes the pharmacy" do
#       pharmacy = pharmacy_fixture()
#       assert {:ok, %Pharmacy{}} = Accounts.delete_pharmacy(pharmacy)
#       assert_raise Ecto.NoResultsError, fn -> Accounts.get_pharmacy!(pharmacy.id) end
#     end

#     test "change_pharmacy/1 returns a pharmacy changeset" do
#       pharmacy = pharmacy_fixture()
#       assert %Ecto.Changeset{} = Accounts.change_pharmacy(pharmacy)
#     end
#   end

#   describe "locations" do
#     alias Scriptr.Accounts.Location

#     @valid_attrs %{latitude: "some latitude", longitude: "some longitude", name: "columbus"}
#     @update_attrs %{latitude: "some updated latitude", longitude: "some updated longitude", name: "akron"}
#     @invalid_attrs %{latitude: nil, longitude: nil}

#     def location_fixture(attrs \\ %{}) do
#       {:ok, location} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Accounts.create_location()

#       location
#     end

#     test "list_locations/0 returns all locations" do
#       location = location_fixture()
#       assert Accounts.list_locations() == [location]
#     end

#     test "get_location!/1 returns the location with given id" do
#       location = location_fixture()
#       assert Accounts.get_location!(location.id) == location
#     end

#     test "create_location/1 with valid data creates a location" do
#       assert {:ok, %Location{} = location} = Accounts.create_location(@valid_attrs)
#       assert location.latitude == "some latitude"
#       assert location.longitude == "some longitude"
#     end

#     test "create_location/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Accounts.create_location(@invalid_attrs)
#     end

#     test "update_location/2 with valid data updates the location" do
#       location = location_fixture()
#       assert {:ok, %Location{} = location} = Accounts.update_location(location, @update_attrs)
#       assert location.latitude == "some updated latitude"
#       assert location.longitude == "some updated longitude"
#     end

#     test "update_location/2 with invalid data returns error changeset" do
#       location = location_fixture()
#       assert {:error, %Ecto.Changeset{}} = Accounts.update_location(location, @invalid_attrs)
#       assert location == Accounts.get_location!(location.id)
#     end

#     test "delete_location/1 deletes the location" do
#       location = location_fixture()
#       assert {:ok, %Location{}} = Accounts.delete_location(location)
#       assert_raise Ecto.NoResultsError, fn -> Accounts.get_location!(location.id) end
#     end

#     test "change_location/1 returns a location changeset" do
#       location = location_fixture()
#       pharmacy = pharmacy_fixture()
#       assert %Ecto.Changeset{} = Accounts.change_location(pharmacy, location)
#     end
#   end

#   describe "patients" do
#     alias Scriptr.Accounts.Patient

#     @valid_attrs %{first_name: "some first_name", last_name: "some last_name"}
#     @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name"}
#     @invalid_attrs %{first_name: nil, last_name: nil}

#     def patient_fixture(attrs \\ %{}) do
#       {:ok, patient} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Accounts.create_patient()

#       patient
#     end

#     test "list_patients/0 returns all patients" do
#       patient = patient_fixture()
#       assert Accounts.list_patients() == [patient]
#     end

#     test "get_patient!/1 returns the patient with given id" do
#       patient = patient_fixture()
#       assert Accounts.get_patient!(patient.id) == patient
#     end

#     test "create_patient/1 with valid data creates a patient" do
#       assert {:ok, %Patient{} = patient} = Accounts.create_patient(@valid_attrs)
#       assert patient.first_name == "some first_name"
#       assert patient.last_name == "some last_name"
#     end

#     test "create_patient/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Accounts.create_patient(@invalid_attrs)
#     end

#     test "update_patient/2 with valid data updates the patient" do
#       patient = patient_fixture()
#       assert {:ok, %Patient{} = patient} = Accounts.update_patient(patient, @update_attrs)
#       assert patient.first_name == "some updated first_name"
#       assert patient.last_name == "some updated last_name"
#     end

#     test "update_patient/2 with invalid data returns error changeset" do
#       patient = patient_fixture()
#       assert {:error, %Ecto.Changeset{}} = Accounts.update_patient(patient, @invalid_attrs)
#       assert patient == Accounts.get_patient!(patient.id)
#     end

#     test "delete_patient/1 deletes the patient" do
#       patient = patient_fixture()
#       assert {:ok, %Patient{}} = Accounts.delete_patient(patient)
#       assert_raise Ecto.NoResultsError, fn -> Accounts.get_patient!(patient.id) end
#     end

#     test "change_patient/1 returns a patient changeset" do
#       patient = patient_fixture()
#       assert %Ecto.Changeset{} = Accounts.change_patient(patient)
#     end
#   end

#   describe "prescriptions" do
#     alias Scriptr.Accounts.Prescription

#     @valid_attrs %{name: "some name"}
#     @update_attrs %{name: "some updated name"}
#     @invalid_attrs %{name: nil}

#     def prescription_fixture(attrs \\ %{}) do
#       {:ok, prescription} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Accounts.create_prescription()

#       prescription
#     end

#     test "list_prescriptions/0 returns all prescriptions" do
#       prescription = prescription_fixture()
#       assert Accounts.list_prescriptions() == [prescription]
#     end

#     test "get_prescription!/1 returns the prescription with given id" do
#       prescription = prescription_fixture()
#       assert Accounts.get_prescription!(prescription.id) == prescription
#     end

#     test "create_prescription/1 with valid data creates a prescription" do
#       assert {:ok, %Prescription{} = prescription} = Accounts.create_prescription(@valid_attrs)
#       assert prescription.name == "some name"
#     end

#     test "create_prescription/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Accounts.create_prescription(@invalid_attrs)
#     end

#     test "update_prescription/2 with valid data updates the prescription" do
#       prescription = prescription_fixture()
#       assert {:ok, %Prescription{} = prescription} = Accounts.update_prescription(prescription, @update_attrs)
#       assert prescription.name == "some updated name"
#     end

#     test "update_prescription/2 with invalid data returns error changeset" do
#       prescription = prescription_fixture()
#       assert {:error, %Ecto.Changeset{}} = Accounts.update_prescription(prescription, @invalid_attrs)
#       assert prescription == Accounts.get_prescription!(prescription.id)
#     end

#     test "delete_prescription/1 deletes the prescription" do
#       prescription = prescription_fixture()
#       assert {:ok, %Prescription{}} = Accounts.delete_prescription(prescription)
#       assert_raise Ecto.NoResultsError, fn -> Accounts.get_prescription!(prescription.id) end
#     end

#     test "change_prescription/1 returns a prescription changeset" do
#       prescription = prescription_fixture()
#       assert %Ecto.Changeset{} = Accounts.change_prescription(prescription)
#     end
#   end

#   describe "orders" do
#     alias Scriptr.Accounts.Order

#     @valid_attrs %{location_id: 42, prescription_id: 42}
#     @update_attrs %{location_id: 43, prescription_id: 43}
#     @invalid_attrs %{location_id: nil, prescription_id: nil}

#     def order_fixture(attrs \\ %{}) do
#       {:ok, order} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Accounts.create_order()

#       order
#     end

#     test "list_orders/0 returns all orders" do
#       order = order_fixture()
#       assert Accounts.list_orders() == [order]
#     end

#     test "get_order!/1 returns the order with given id" do
#       order = order_fixture()
#       assert Accounts.get_order!(order.id) == order
#     end

#     test "create_order/1 with valid data creates a order" do
#       assert {:ok, %Order{} = order} = Accounts.create_order(@valid_attrs)
#       assert order.location_id == 42
#       assert order.prescription_id == 42
#     end

#     test "create_order/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Accounts.create_order(@invalid_attrs)
#     end

#     test "update_order/2 with valid data updates the order" do
#       order = order_fixture()
#       assert {:ok, %Order{} = order} = Accounts.update_order(order, @update_attrs)
#       assert order.location_id == 43
#       assert order.prescription_id == 43
#     end

#     test "update_order/2 with invalid data returns error changeset" do
#       order = order_fixture()
#       assert {:error, %Ecto.Changeset{}} = Accounts.update_order(order, @invalid_attrs)
#       assert order == Accounts.get_order!(order.id)
#     end

#     test "delete_order/1 deletes the order" do
#       order = order_fixture()
#       assert {:ok, %Order{}} = Accounts.delete_order(order)
#       assert_raise Ecto.NoResultsError, fn -> Accounts.get_order!(order.id) end
#     end

#     test "change_order/1 returns a order changeset" do
#       order = order_fixture()
#       assert %Ecto.Changeset{} = Accounts.change_order(order)
#     end
#   end
# end
