defmodule Scriptr.AccountsTest do
  use Scriptr.DataCase

  alias Scriptr.Accounts

  describe "pharmacies" do
    alias Scriptr.Accounts.Pharmacy

    @valid_attrs %{encrypted_password: "some encrypted_password", name: "some name", username: "some username"}
    @update_attrs %{encrypted_password: "some updated encrypted_password", name: "some updated name", username: "some updated username"}
    @invalid_attrs %{encrypted_password: nil, name: nil, username: nil}

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Accounts.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Accounts.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.create_pharmacy(@valid_attrs)
      # assert pharmacy.encrypted_password == "some encrypted_password"
      assert pharmacy.name == "some name"
      assert pharmacy.username == "some username"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.update_pharmacy(pharmacy, @update_attrs)
      # assert pharmacy.encrypted_password == "some updated encrypted_password"
      assert pharmacy.name == "some updated name"
      assert pharmacy.username == "some updated username"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Accounts.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Accounts.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Accounts.change_pharmacy(pharmacy)
    end
  end
end
