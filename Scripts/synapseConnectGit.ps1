param(
    [string]$repositoryType,
    [string]$accountName,
    [string]$repositoryName,
    [string]$collaborationBranch,
    [string]$synapseWorkspaceName
)

#Configures Git Repo for Synapse Workspace
# Set-AzContext -Tenant (Get-AzContext -ListAvailable).Tenant -Subscription $subscriptionId

try {
    $config = New-AzSynapseGitRepositoryConfig -RepositoryType $repositoryType -AccountName $accountName -RepositoryName $repositoryName -CollaborationBranch $collaborationBranch
    Update-AzSynapseWorkspace -Name $synapseWorkspaceName -GitRepository $config

}
catch {
    Write-Host Error encountered - $_.Exception
}