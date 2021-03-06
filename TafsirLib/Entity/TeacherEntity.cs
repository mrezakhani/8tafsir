﻿using System.ComponentModel;

namespace TafsirLib.Entity
{
	public class TeacherEntity 
	{
		#region Properties

		[DisplayName("شناسه")]
		public int Id { get; set; } = 0;

		[DisplayName("نام")]
		public string FirstName { get; set; } = string.Empty;

		[DisplayName("نام خانوادگی")]
		public string LastName { get; set; } = string.Empty;

		[DisplayName("نام کاربری")]
		public string UserName { get; set; } = string.Empty;

		[DisplayName("رمز عبور")]
		public string Password { get; set; } = string.Empty;

		[DisplayName("تصویر")]
		public string Image { get; set; } = string.Empty;

		[DisplayName("فعال")]
		public string Active { get; set; } = string.Empty;

		[DisplayName("تحصیلات")]
		public string Grade { get; set; } = string.Empty;

		[DisplayName("رزومه")]
		public string Rezome { get; set; } = string.Empty;

		[DisplayName("تاریخ تولد")]
		public string BirthDate { get; set; } = string.Empty;

		[DisplayName("آدرس")]
		public string Address { get; set; } = string.Empty;

		[DisplayName("ایمیل")]
		public string Email { get; set; } = string.Empty;

		[DisplayName("تلفن")]
		public string Tel { get; set; } = string.Empty;

		#endregion Properties

	}
}