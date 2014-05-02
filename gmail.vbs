' ref. http://notes.ponderworthy.com/send-email-via-gmail-smtp-by-vbscript

EmailSubject = "incomeing FATE"
EmailBody = "let's fuck!"

Const EmailFrom = "君のGoogleアカウント名@gmail.com"
Const EmailFromName = "Captain Teemo"
Const EmailTo = "送信先メールアドレス@gmail.com"
Const SMTPServer = "smtp.gmail.com"
Const SMTPLogon = "君のGoogleアカウント名@gmail.com"
Const SMTPPassword = "君のGoogleパスワード"
Const SMTPSSL = True
Const SMTPPort = 465

Const cdoSendUsingPickup = 1 	'Send message using local SMTP service pickup directory.
Const cdoSendUsingPort = 2 	'Send the message using SMTP over TCP/IP networking.

Const cdoAnonymous = 0 	' No authentication
Const cdoBasic = 1 	' BASIC clear text authentication
Const cdoNTLM = 2 	' NTLM, Microsoft proprietary authentication

' First, create the message

Set objMessage = CreateObject("CDO.Message")
objMessage.Subject = EmailSubject
objMessage.From = """" & EmailFromName & """ <" & EmailFrom & ">"
objMessage.To = EmailTo
objMessage.TextBody = EmailBody

' Second, configure the server

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") = SMTPServer

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = cdoBasic

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusername") = SMTPLogon

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendpassword") = SMTPPassword

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = SMTPPort

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = SMTPSSL

objMessage.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60

objMessage.Configuration.Fields.Update

' Now send the message!

objMessage.Send