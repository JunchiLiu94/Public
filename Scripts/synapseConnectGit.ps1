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

try {
    Update-AzSynapseWorkspace -Name $synapseWorkspaceName -GitRepository $config
    $config = New-AzSynapseGitRepositoryConfig -RepositoryType $repositoryType -AccountName $accountName -RepositoryName $repositoryName -CollaborationBranch $collaborationBranch

}
catch {
    Write-Host Error encountered - $_.Exception
}