using System;
using System.Linq;
using System.Web.UI.WebControls;
using ProfileForm.Enums;

namespace ProfileForm
{
    public partial class ProfileForm : System.Web.UI.Page
    {
        private ProfileDatabaseEntities entities = new ProfileDatabaseEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtAge.Text = "";
            txtPhoneNumber.Text = "";
            rblGender.SelectedIndex = 0;
            txtEmail.Text = "";
            txtAddress.Text = "";

            btnDelete.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Profile profile = GetProfile();

            if(profile.Id != 0)
                entities.Profiles.Remove(entities.Profiles.SingleOrDefault(item => item.Id == profile.Id));

            entities.Profiles.Add(profile);
            entities.SaveChanges();

            btnDelete.Enabled = false;
            FillGridView();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            int profileId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            hfId.Value = profileId.ToString();
            var profile = entities.Profiles.SingleOrDefault(item => item.Id == profileId);
            FillForm(profile);

            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Profile profile = GetProfile();
            Profile dbProfile = entities.Profiles.SingleOrDefault(item => item.Id == profile.Id);

            entities.Profiles.Remove(entities.Profiles.Remove(dbProfile));
            entities.SaveChanges();
            FillGridView();
        }

        private void FillGridView()
        {
            gvProfiles.DataSource = (from profile in entities.Profiles select profile).ToList();
            gvProfiles.DataBind();
        }

        private void FillForm(Profile profile)
        {
            var profileGender = (Gender)Enum.Parse(typeof(Gender), profile.Gender);

            txtFirstName.Text = profile.FirstName;
            txtLastName.Text = profile.LastName;
            txtAge.Text = profile.Age.ToString();
            txtPhoneNumber.Text = profile.PhoneNumber.ToString();
            rblGender.SelectedIndex = profileGender == Gender.MALE ? 0 : 1;
            txtEmail.Text = profile.Email;
            txtAddress.Text = profile.Address;
        }

        private Profile GetProfile()
        {
            int id = string.IsNullOrEmpty(hfId.Value) ? 0 : Convert.ToInt32(hfId.Value);
            int age = string.IsNullOrEmpty(txtAge.Text) ? 0 : Convert.ToInt32(txtAge.Text);

            return new Profile()
            {
                Id = id,
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Age = age,
                PhoneNumber = txtPhoneNumber.Text,
                Gender = rblGender.SelectedValue,
                Email = txtEmail.Text,
                Address = txtAddress.Text,
                CreatedAt = DateTime.Now
            };
        }
    }
}
