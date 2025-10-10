#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_domain_controller_info_1w
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset Unicode
 */
class DS_DOMAIN_CONTROLLER_INFO_1W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the NetBIOS name of the domain controller.
     * @type {Pointer<Char>}
     */
    NetbiosName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated  string that specifies the DNS host name of the domain controller.
     * @type {Pointer<Char>}
     */
    DnsHostName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated  string that specifies the site to which the domain controller belongs.
     * @type {Pointer<Char>}
     */
    SiteName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the computer object on the domain controller.
     * @type {Pointer<Char>}
     */
    ComputerObjectName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated  string that specifies the name of the server object on the domain controller.
     * @type {Pointer<Char>}
     */
    ServerObjectName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A Boolean value that indicates whether or not this domain controller is the primary domain controller. If this value is <b>TRUE</b>, the domain controller is the primary domain controller; otherwise, the domain controller is not the primary domain controller.
     * @type {Integer}
     */
    fIsPdc {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * A Boolean value that indicates whether or not the domain controller is enabled. If this value is <b>TRUE</b>, the domain controller is enabled; otherwise, it is not enabled.
     * @type {Integer}
     */
    fDsEnabled {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
