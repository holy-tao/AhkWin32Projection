#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The DS_DOMAIN_CONTROLLER_INFO_3 structure contains data about a domain controller. This structure is returned by the DsGetDomainControllerInfo function.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> function can return different versions of this structure. For more information and a list of the currently supported versions, see the <i>InfoLevel</i> parameter of <b>DsGetDomainControllerInfo</b>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntdsapi.h header defines DS_DOMAIN_CONTROLLER_INFO_3 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_domain_controller_info_3w
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset Unicode
 */
class DS_DOMAIN_CONTROLLER_INFO_3W extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the NetBIOS name of the domain controller.
     * @type {PWSTR}
     */
    NetbiosName{
        get {
            if(!this.HasProp("__NetbiosName"))
                this.__NetbiosName := PWSTR(this.ptr + 0)
            return this.__NetbiosName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the DNS host name of the domain controller.
     * @type {PWSTR}
     */
    DnsHostName{
        get {
            if(!this.HasProp("__DnsHostName"))
                this.__DnsHostName := PWSTR(this.ptr + 8)
            return this.__DnsHostName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the site to which the domain controller belongs.
     * @type {PWSTR}
     */
    SiteName{
        get {
            if(!this.HasProp("__SiteName"))
                this.__SiteName := PWSTR(this.ptr + 16)
            return this.__SiteName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the site object on the domain controller.
     * @type {PWSTR}
     */
    SiteObjectName{
        get {
            if(!this.HasProp("__SiteObjectName"))
                this.__SiteObjectName := PWSTR(this.ptr + 24)
            return this.__SiteObjectName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the computer object on the domain controller.
     * @type {PWSTR}
     */
    ComputerObjectName{
        get {
            if(!this.HasProp("__ComputerObjectName"))
                this.__ComputerObjectName := PWSTR(this.ptr + 32)
            return this.__ComputerObjectName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the server object on the domain controller.
     * @type {PWSTR}
     */
    ServerObjectName{
        get {
            if(!this.HasProp("__ServerObjectName"))
                this.__ServerObjectName := PWSTR(this.ptr + 40)
            return this.__ServerObjectName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the NTDS DSA object on the domain controller.
     * @type {PWSTR}
     */
    NtdsDsaObjectName{
        get {
            if(!this.HasProp("__NtdsDsaObjectName"))
                this.__NtdsDsaObjectName := PWSTR(this.ptr + 48)
            return this.__NtdsDsaObjectName
        }
    }

    /**
     * A Boolean value that indicates whether or not this domain controller is the primary domain controller. If this value is <b>TRUE</b>, the domain controller is the primary domain controller; otherwise, the domain controller is not the primary domain controller.
     * @type {BOOL}
     */
    fIsPdc{
        get {
            if(!this.HasProp("__fIsPdc"))
                this.__fIsPdc := BOOL(this.ptr + 56)
            return this.__fIsPdc
        }
    }

    /**
     * A Boolean value that indicates whether or not the domain controller is enabled. If this value is <b>TRUE</b>, the domain controller is enabled; otherwise, it is not enabled.
     * @type {BOOL}
     */
    fDsEnabled{
        get {
            if(!this.HasProp("__fDsEnabled"))
                this.__fDsEnabled := BOOL(this.ptr + 60)
            return this.__fDsEnabled
        }
    }

    /**
     * A Boolean value that indicates whether or not the domain controller is global catalog server. If this value is <b>TRUE</b>, the domain controller is a global catalog server; otherwise, it is not a global catalog server.
     * @type {BOOL}
     */
    fIsGc{
        get {
            if(!this.HasProp("__fIsGc"))
                this.__fIsGc := BOOL(this.ptr + 64)
            return this.__fIsGc
        }
    }

    /**
     * A Boolean value that indicates if the domain controller is a read-only domain controller. If this value is <b>TRUE</b>, the domain controller is a read-only domain controller; otherwise, it is not a read-only domain controller.
     * @type {BOOL}
     */
    fIsRodc{
        get {
            if(!this.HasProp("__fIsRodc"))
                this.__fIsRodc := BOOL(this.ptr + 68)
            return this.__fIsRodc
        }
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
