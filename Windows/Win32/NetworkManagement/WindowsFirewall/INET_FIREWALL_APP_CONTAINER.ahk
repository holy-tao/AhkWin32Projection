#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\INET_FIREWALL_AC_BINARIES.ahk" { INET_FIREWALL_AC_BINARIES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import ".\INET_FIREWALL_AC_CAPABILITIES.ahk" { INET_FIREWALL_AC_CAPABILITIES }

/**
 * The INET_FIREWALL_APP_CONTAINER structure contains information about a specific app container. (INET_FIREWALL_APP_CONTAINER)
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-inet_firewall_app_container
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INET_FIREWALL_APP_CONTAINER {
    #StructPack 8

    /**
     * Type: <b>SID*</b>
     * 
     * The package identifier of the app container
     */
    appContainerSid : SID.Ptr

    /**
     * Type: <b>SID*</b>
     * 
     * The security identifier (SID) of the user to whom the app container belongs.
     */
    userSid : SID.Ptr

    /**
     * Type: <b>LPWSTR</b>
     * 
     * The app container's globally unique name.
     * 
     *  Also referred to as the  Package Family Name, for the app container of a Windows Store app.
     */
    appContainerName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Friendly name of the app container
     */
    displayName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A description of the app container (its use, the objective of the application that uses it, etc.)
     */
    description : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/networkisolation/ns-networkisolation-inet_firewall_ac_capabilities">INET_FIREWALL_AC_CAPABILITIES</a></b>
     * 
     * The capabilities of the app container.
     */
    capabilities : INET_FIREWALL_AC_CAPABILITIES

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/netfw/ns-netfw-inet_firewall_ac_binaries">INET_FIREWALL_AC_BINARIES</a></b>
     * 
     * Binary paths to the applications running in the app container.
     */
    binaries : INET_FIREWALL_AC_BINARIES

    workingDirectory : PWSTR

    packageFullName : PWSTR

}
