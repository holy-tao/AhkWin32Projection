#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DS_DOMAIN_CONTROLLER_INFO_1 structure contains data about a domain controller. This structure is returned by the DsGetDomainControllerInfo function. (ANSI)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> function can return different versions of this structure. For more information and a list of the currently supported versions, see the <i>InfoLevel</i> parameter of <b>DsGetDomainControllerInfo</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_DOMAIN_CONTROLLER_INFO_1 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_domain_controller_info_1a
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset ANSI
 */
export default struct DS_DOMAIN_CONTROLLER_INFO_1A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the NetBIOS name of the domain controller.
     */
    NetbiosName : PSTR

    /**
     * Pointer to a null-terminated  string that specifies the DNS host name of the domain controller.
     */
    DnsHostName : PSTR

    /**
     * Pointer to a null-terminated  string that specifies the site to which the domain controller belongs.
     */
    SiteName : PSTR

    /**
     * Pointer to a null-terminated  string that specifies the name of the computer object on the domain controller.
     */
    ComputerObjectName : PSTR

    /**
     * Pointer to a null-terminated  string that specifies the name of the server object on the domain controller.
     */
    ServerObjectName : PSTR

    /**
     * A Boolean value that indicates whether or not this domain controller is the primary domain controller. If this value is <b>TRUE</b>, the domain controller is the primary domain controller; otherwise, the domain controller is not the primary domain controller.
     */
    fIsPdc : BOOL

    /**
     * A Boolean value that indicates whether or not the domain controller is enabled. If this value is <b>TRUE</b>, the domain controller is enabled; otherwise, it is not enabled.
     */
    fDsEnabled : BOOL

}
