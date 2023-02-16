private void btnLogin_Click(object sender, System.EventArgs e)
		{
			string s="select * from administer where TLgionId='" +txtID.Text.ToString()+ "'";
			db.conn.Open();
			OleDbCommand comm=new OleDbCommand (s,db.conn  );
			OleDbDataReader myReader=comm.ExecuteReader(CommandBehavior.CloseConnection);
			if (myReader.Read ())
			{
				if (myReader["TLgionPwd"].ToString().Trim()==txtPwd.Text.ToString())
				{
					(new AmainForm()).Show();
					this.Hide();
					myReader.Close();
					db.conn.Close();
				}
				else
				{
					MessageBox.Show("登录失败");
					if(cboType.Text=="")
					{
						MessageBox.Show("请选择类型！","提示",MessageBoxButtons.OK,MessageBoxIcon.Information);
						return;
					}
				}
			}
				myReader.Close();
			db.conn.Close();

		}
