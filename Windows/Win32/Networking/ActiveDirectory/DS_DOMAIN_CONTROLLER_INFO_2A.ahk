#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DS_DOMAIN_CONTROLLER_INFO_2 structure contains data about a domain controller. This structure is returned by the DsGetDomainControllerInfo function.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> function can return different versions of this structure. For more information and a list of the currently supported versions, see the <i>InfoLevel</i> parameter of <b>DsGetDomainControllerInfo</b>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntdsapi.h header defines DS_DOMAIN_CONTROLLER_INFO_2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_domain_controller_info_2a
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset ANSI
 */
class DS_DOMAIN_CONTROLLER_INFO_2A extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the NetBIOS name of the domain controller.
     * @type {PSTR}
     */
    NetbiosName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated  string that specifies the DNS host name of the domain controller.
     * @type {PSTR}
     */
    DnsHostName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated  string that specifies the site to which the domain controller belongs.
     * @type {PSTR}
     */
    SiteName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the site object on the domain controller.
     * @type {PSTR}
     */
    SiteObjectName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the computer object on the domain controller.
     * @type {PSTR}
     */
    ComputerObjectName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the server object on the domain controller.
     * @type {PSTR}
     */
    ServerObjectName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the NTDS DSA object on the domain controller.
     * @type {PSTR}
     */
    NtdsDsaObjectName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A Boolean value that indicates whether or not this domain controller is the primary domain controller. If this value is <b>TRUE</b>, the domain controller is the primary domain controller; otherwise, the domain controller is not the primary domain controller.
     * @type {BOOL}
     */
    fIsPdc {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A Boolean value that indicates whether or not the domain controller is enabled. If this value is <b>TRUE</b>, the domain controller is enabled; otherwise, it is not enabled.
     * @type {BOOL}
     */
    fDsEnabled {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * A Boolean value that indicates whether or not the domain controller is global catalog server. If this value is <b>TRUE</b>, the domain controller is a global catalog server; otherwise, it is not a global catalog server.
     * @type {BOOL}
     */
    fIsGc {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Contains the <b>GUID</b> for the site object on the domain controller.
     * @type {Pointer<Guid>}
     */
    SiteObjectGuid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Contains the <b>GUID</b> for the computer object on the domain controller.
     * @type {Pointer<Guid>}
     */
    ComputerObjectGuid {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Contains the <b>GUID</b> for the server object on the domain controller.
     * @type {Pointer<Guid>}
     */
    ServerObjectGuid {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Contains the <b>GUID</b> for the NTDS DSA object on the domain controller.
     * @type {Pointer<Guid>}
     */
    NtdsDsaObjectGuid {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
