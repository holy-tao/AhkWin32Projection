#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The DS_DOMAIN_CONTROLLER_INFO_1 structure contains data about a domain controller. This structure is returned by the DsGetDomainControllerInfo function.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa">DsGetDomainControllerInfo</a> function can return different versions of this structure. For more information and a list of the currently supported versions, see the <i>InfoLevel</i> parameter of <b>DsGetDomainControllerInfo</b>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntdsapi.h header defines DS_DOMAIN_CONTROLLER_INFO_1 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_domain_controller_info_1a
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset ANSI
 */
class DS_DOMAIN_CONTROLLER_INFO_1A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the NetBIOS name of the domain controller.
     * @type {PSTR}
     */
    NetbiosName{
        get {
            if(!this.HasProp("__NetbiosName"))
                this.__NetbiosName := PSTR(this.ptr + 0)
            return this.__NetbiosName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the DNS host name of the domain controller.
     * @type {PSTR}
     */
    DnsHostName{
        get {
            if(!this.HasProp("__DnsHostName"))
                this.__DnsHostName := PSTR(this.ptr + 8)
            return this.__DnsHostName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the site to which the domain controller belongs.
     * @type {PSTR}
     */
    SiteName{
        get {
            if(!this.HasProp("__SiteName"))
                this.__SiteName := PSTR(this.ptr + 16)
            return this.__SiteName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the computer object on the domain controller.
     * @type {PSTR}
     */
    ComputerObjectName{
        get {
            if(!this.HasProp("__ComputerObjectName"))
                this.__ComputerObjectName := PSTR(this.ptr + 24)
            return this.__ComputerObjectName
        }
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the server object on the domain controller.
     * @type {PSTR}
     */
    ServerObjectName{
        get {
            if(!this.HasProp("__ServerObjectName"))
                this.__ServerObjectName := PSTR(this.ptr + 32)
            return this.__ServerObjectName
        }
    }

    /**
     * A Boolean value that indicates whether or not this domain controller is the primary domain controller. If this value is <b>TRUE</b>, the domain controller is the primary domain controller; otherwise, the domain controller is not the primary domain controller.
     * @type {BOOL}
     */
    fIsPdc{
        get {
            if(!this.HasProp("__fIsPdc"))
                this.__fIsPdc := BOOL(this.ptr + 40)
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
                this.__fDsEnabled := BOOL(this.ptr + 44)
            return this.__fDsEnabled
        }
    }
}
