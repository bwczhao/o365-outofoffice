<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.179
	 Created on:   	7/26/2020 11:31 PM
	 Created by:   	byron.zhao
	 Organization: 	Lendmark Financial Services
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		This PowerShell is to help set up a user mailbox, or a shared mailbox's auto reply but using out of office message. 
		Currently it support text only.
#>



$UPN = Read-Host "Enter the user's UPN"
$Msg = Read-Host "What is the out of office message"
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking
Set-MailboxAutoReplyConfiguration -Identity $UPN -AutoReplyState Enabled -InternalMessage $msg
Remove-PSSession $Session
