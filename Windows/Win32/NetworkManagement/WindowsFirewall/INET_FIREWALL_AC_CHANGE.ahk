#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\INET_FIREWALL_AC_CAPABILITIES.ahk" { INET_FIREWALL_AC_CAPABILITIES }
#Import "..\..\Security\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\INET_FIREWALL_AC_CHANGE_TYPE.ahk" { INET_FIREWALL_AC_CHANGE_TYPE }
#Import ".\INET_FIREWALL_AC_CREATION_TYPE.ahk" { INET_FIREWALL_AC_CREATION_TYPE }
#Import ".\INET_FIREWALL_AC_BINARIES.ahk" { INET_FIREWALL_AC_BINARIES }

/**
 * The INET_FIREWALL_AC_CHANGE structure contains information about a change made to an app container. (INET_FIREWALL_AC_CHANGE)
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-inet_firewall_ac_change
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INET_FIREWALL_AC_CHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/netfw/ne-netfw-inet_firewall_ac_change_type">INET_FIREWALL_AC_CHANGE_TYPE</a></b>
     * 
     * The type of change made.
     */
    changeType : INET_FIREWALL_AC_CHANGE_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/networkisolation/ne-networkisolation-inet_firewall_ac_creation_type">INET_FIREWALL_AC_CREATION_TYPE</a></b>
     * 
     * The method by which the app container was created.
     */
    createType : INET_FIREWALL_AC_CREATION_TYPE

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
     * Friendly name of the app container.
     */
    displayName : PWSTR

    capabilities : INET_FIREWALL_AC_CAPABILITIES

    static __New() {
        DefineProp(this.Prototype, 'binaries', { type: INET_FIREWALL_AC_BINARIES, offset: 32 })
        this.DeleteProp("__New")
    }
}
