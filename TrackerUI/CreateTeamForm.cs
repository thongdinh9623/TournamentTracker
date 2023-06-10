using System;
using System.Collections.Generic;
using System.Windows.Forms;
using TrackerLibrary;
using TrackerLibrary.Models;

namespace TrackerUI
{
    public partial class CreateTeamForm : Form
    {
        private List<PersonModel> availableTeamMembers = new List<PersonModel>();
        private List<PersonModel> selectedTeamMembers = new List<PersonModel>();

        public CreateTeamForm()
        {
            InitializeComponent();
            CreateSampleData();
            WireUpLists();
        }

        private void createMemberButton_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                PersonModel p = new PersonModel()
                {
                    FirstName = firstNameValue.Text,
                    LastName = lastNameValue.Text,
                    EmailAddress = emailValue.Text,
                    CellphoneNumber = cellPhoneValue.Text
                };

                GlobalConfig.Connection.CreatePerson(p);
                firstNameValue.Text = string.Empty;
                lastNameValue.Text = string.Empty;
                emailValue.Text = string.Empty;
                cellPhoneValue.Text = string.Empty;
            }
            else
            {
                MessageBox.Show("You need to fill in all the fields.");
            }
        }

        private bool ValidateForm()
        {
            if (firstNameValue.Text.Length == 0
                || lastNameValue.Text.Length == 0
                || emailValue.Text.Length == 0
                || cellPhoneValue.Text.Length == 0)
            {
                return false;
            }

            return true;
        }

        private void WireUpLists()
        {
            selectTeamMemberDropDown.DataSource = availableTeamMembers;
            selectTeamMemberDropDown.DisplayMember = "FullName";
            teamMembersListBox.DataSource = selectedTeamMembers;
            teamMembersListBox.DisplayMember = "FullName";
        }

        private void CreateSampleData()
        {
            availableTeamMembers.Add(new PersonModel()
            {
                FirstName = "Tim",
                LastName = "Corey"
            });
            availableTeamMembers.Add(new PersonModel()
            {
                FirstName = "Tim",
                LastName = "Corey"
            });
            selectedTeamMembers.Add(new PersonModel()
            {
                FirstName = "Jane",
                LastName = "Smith"
            });
            selectedTeamMembers.Add(new PersonModel()
            {
                FirstName = "Bill",
                LastName = "Jones"
            });
        }
    }
}
