param(
    [string]$subscriptionId,
    [string]$repositoryType,
    [string]$accountName,
    [string]$repositoryName,
    [string]$collaborationBranch,
    [string]$synapseWorkspaceName
)

#Configures Git Repo for Synapse Workspace
Select-AzSubscription -SubscriptionId $subscriptionId
Write-Host $subscriptionId
Write-Host $repositoryType
Write-Host $accountName
Write-Host $repositoryName
Write-Host $collaborationBranch
Write-Host $synapseWorkspaceName

try {
    $config = New-AzSynapseGitRepositoryConfig -RepositoryType $repositoryType -AccountName $accountName -RepositoryName $repositoryName -CollaborationBranch $collaborationBranch
    Update-AzSynapseWorkspace -Name $synapseWorkspaceName -GitRepository $config

}
catch {
    Write-Host Error encountered - $_.Exception
}