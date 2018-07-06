<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2018 v5.5.152
	 Created on:   	06/07/2018 12:35
	 Created by:   	c.baillie
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		PowerShell script to query AD Groups for membership list and count
#>

$Folder = "C:\temp\"
if (-not (Test-Path $Folder))
{
	md $Folder	
}

Add-Type -AssemblyName PresentationFramework
$Group = Read-Host -Prompt "Provide the group name: "
$File = $Folder + $Group + ".txt"

if (Test-Path $File)
{
	Remove-Item $File	
}

$Count = 0;
try
{
	$Members = Get-ADGroupMember -Identity $Group
	
	ForEach ($Member in $Members)
	{
		$Count++
		$Member.name | Out-File $File -Append
	}
	
	$OutStr = "There are " + $Count + " users in this group."
	[System.Windows.MessageBox]::Show($OutStr, $Group)
	
	if (Test-Path $File)
	{
		notepad.exe $File
	}
}
catch
{
	$OutStr = "I couldn't find a group called " + $Group
	[System.Windows.MessageBox]::Show($OutStr, "Error", 'OK', 'Error')	
}
