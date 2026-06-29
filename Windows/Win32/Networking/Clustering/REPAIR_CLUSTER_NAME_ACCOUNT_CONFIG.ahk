#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct REPAIR_CLUSTER_NAME_ACCOUNT_CONFIG {
    #StructPack 8

    dwVersion : UInt32

    dwFlags : UInt32

    pszUserName : PWSTR

    pszPassword : PWSTR

    pszDomain : PWSTR

}
