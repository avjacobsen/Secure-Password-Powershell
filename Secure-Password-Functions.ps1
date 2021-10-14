# Get string from secure password with Read-Host
$HashedSecureString = (Read-Host -AsSecureString -Prompt "Password" | ConvertFrom-SecureString)
Write-Host "HashedSecureString: $HashedSecureString"

# Get Password from hashed secure string
$SecureString = $HashedSecureString | ConvertTo-SecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
$PlainTextString = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
Write-Host "Your plain text string: $PlainTextString"
