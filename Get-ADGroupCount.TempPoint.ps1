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
$Group = Read-Host -Prompt "Provide the group name: "
Write-Host $Group
