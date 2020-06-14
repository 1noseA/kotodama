# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.new(name: "テストユーザー", email: "test@example.com",
    message: "問い合わせメッセージ")

    InquiryMailer.send_mail(inquiry)
  end
end
