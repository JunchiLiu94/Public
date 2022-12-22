param(
    [string]$repositoryType,
    [string]$accountName,
    [string]$repositoryName,
    [string]$collaborationBranch,
    [string]$synapseWorkspaceName
)

#Configures Git Repo for Synapse Workspace
$config = New-AzSynapseGitRepositoryConfig -RepositoryType $repositoryType -AccountName $accountName -RepositoryName $repositoryName -CollaborationBranch $collaborationBranch

Update-AzSynapseWorkspace -Name $synapseWorkspaceName -GitRepository $config