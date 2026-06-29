#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains credentials used to authorize a client session.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/ns-wdsclientapi-wds_cli_cred
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_CLI_CRED {
    #StructPack 8

    /**
     * The user name associated with the credentials.
     */
    pwszUserName : PWSTR

    /**
     * The domain for the user name associated with the credentials.
     */
    pwszDomain : PWSTR

    /**
     * The password for the user name associated with the credentials.
     */
    pwszPassword : PWSTR

}
