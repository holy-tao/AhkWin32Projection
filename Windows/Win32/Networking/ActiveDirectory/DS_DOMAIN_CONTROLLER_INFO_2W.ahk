#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DS_DOMAIN_CONTROLLER_INFO_2 structure contains data about a domain controller. This structure is returned by the DsGetDomainControllerInfo function. (Unicode)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> function can return different versions of this structure. For more information and a list of the currently supported versions, see the <i>InfoLevel</i> parameter of <b>DsGetDomainControllerInfo</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_DOMAIN_CONTROLLER_INFO_2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_domain_controller_info_2w
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset Unicode
 */
export default struct DS_DOMAIN_CONTROLLER_INFO_2W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the NetBIOS name of the domain controller.
     */
    NetbiosName : PWSTR

    /**
     * Pointer to a null-terminated  string that specifies the DNS host name of the domain controller.
     */
    DnsHostName : PWSTR

    /**
     * Pointer to a null-terminated  string that specifies the site to which the domain controller belongs.
     */
    SiteName : PWSTR

    /**
     * Pointer to a null-terminated  string that specifies the name of the site object on the domain controller.
     */
    SiteObjectName : PWSTR

    /**
     * Pointer to a null-terminated  string that specifies the name of the computer object on the domain controller.
     */
    ComputerObjectName : PWSTR

    /**
     * Pointer to a null-terminated  string that specifies the name of the server object on the domain controller.
     */
    ServerObjectName : PWSTR

    /**
     * Pointer to a null-terminated  string that specifies the name of the NTDS DSA object on the domain controller.
     */
    NtdsDsaObjectName : PWSTR

    /**
     * A Boolean value that indicates whether or not this domain controller is the primary domain controller. If this value is <b>TRUE</b>, the domain controller is the primary domain controller; otherwise, the domain controller is not the primary domain controller.
     */
    fIsPdc : BOOL

    /**
     * A Boolean value that indicates whether or not the domain controller is enabled. If this value is <b>TRUE</b>, the domain controller is enabled; otherwise, it is not enabled.
     */
    fDsEnabled : BOOL

    /**
     * A Boolean value that indicates whether or not the domain controller is global catalog server. If this value is <b>TRUE</b>, the domain controller is a global catalog server; otherwise, it is not a global catalog server.
     */
    fIsGc : BOOL

    /**
     * Contains the <b>GUID</b> for the site object on the domain controller.
     */
    SiteObjectGuid : Guid

    /**
     * Contains the <b>GUID</b> for the computer object on the domain controller.
     */
    ComputerObjectGuid : Guid

    /**
     * Contains the <b>GUID</b> for the server object on the domain controller.
     */
    ServerObjectGuid : Guid

    /**
     * Contains the <b>GUID</b> for the NTDS DSA object on the domain controller.
     */
    NtdsDsaObjectGuid : Guid

}
