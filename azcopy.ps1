$tokena = $(az storage container generate-sas --account-name "teststoragecanada1" --name 2023dev --permissions rl --expiry 2024-10-15T23:59:00Z --auth-mode login --as-user --https-only --output tsv)
$tokenb = $(az storage container generate-sas --account-name "teststoragecanada2" --name 2023dev --permissions rlwau --expiry 2024-10-15T23:59:00Z --auth-mode login --as-user --https-only --output tsv)
$tokena
$tokenb

.\azcopy.exe copy "https://teststoragecanada1.blob.core.windows.net/2023dev?$tokena" "https://teststoragecanada2.blob.core.windows.net/?$tokenb" --recursive
