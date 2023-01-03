param(
    [string]$synapseWorkspaceName,
    [string]$roleDeinitionName,
    [string]$signInName
)

#Adds a role to a specific user in a Synapse Workspace

try {
    New-AzSynapseRoleAssignment -WorkspaceName $synapseWorkspaceName -RoleDefinitionName $roleDeinitionName -SignInName $signInName
    Write-Host $signInName successfully added as a $roleDeinitionName
}
catch {
    Write-Host Error encountered - $_.Exception
}