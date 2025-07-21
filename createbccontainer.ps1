    # Here you can give the name of the container
    $containerName = '{ContainerName}'
    # Here you can give the password for your container
    $password = '{Passowrd}'
    $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
    $credential = New-Object pscredential '{UserName}', $securePassword
    $auth = 'UserPassword'
    # Here you can choose country and version of the business central
    $artifactUrl = Get-BcArtifactUrl -type 'OnPrem' -country 'w1' -select 'Latest'
    #Here you can provide the license file 
    $licenseFile = '{LicensePath}'
    New-BcContainer -accept_eula `
        -containerName $containerName `
        -credential $credential `
        -auth $auth `
        -artifactUrl $artifactUrl `
        -licenseFile $licenseFile `
        -includeAL -doNotExportObjectsToText `
        -isolation hyperv `
        -updateHosts