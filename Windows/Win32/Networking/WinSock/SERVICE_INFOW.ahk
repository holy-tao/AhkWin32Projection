#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\BLOB.ahk

/**
 * Contains information about a network service or a network service type. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The nspapi.h header defines SERVICE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-service_infow
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset Unicode
 */
class SERVICE_INFOW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>LPGUID</b>
     * 
     * A pointer to a GUID that is the type of the network service.
     * @type {Pointer<Guid>}
     */
    lpServiceType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated string that is the name of the network service. 
     * 
     * 
     * 
     * 
     * If you are calling the 
     * <b>SetService</b> function with the <i>dwNameSpace</i> parameter set to NS_DEFAULT, the network service name must be a common name. A common name is what the network service is commonly known as. An example of a common name for a network service is "My SQL Server".
     * 
     * If you are calling the 
     * <b>SetService</b> function with the <i>dwNameSpace</i> parameter set to a specific service name, the network service name can be a common name or a distinguished name. A distinguished name distinguishes the service to a unique location with a directory service. An example of a distinguished name for a network service is "MS\\SYS\\NT\\DEV\\My SQL Server".
     * @type {Pointer<Char>}
     */
    lpServiceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated string that is a comment or description for the network service. For example, "Used for development upgrades."
     * @type {Pointer<Char>}
     */
    lpComment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated string that contains locale information.
     * @type {Pointer<Char>}
     */
    lpLocale {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwDisplayHint {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The version for the network service. The high word of this value specifies a major version number. The low word of this value specifies a minor version number.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved for future use. Must be zero.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated string that is the name of the computer on which the network service is running.
     * @type {Pointer<Char>}
     */
    lpMachineName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPSERVICE_ADDRESSES</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_addresses">SERVICE_ADDRESSES</a> structure that contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_address">SERVICE_ADDRESS</a> structures. Each 
     * <b>SERVICE_ADDRESS</b> structure contains information about a network service address. 
     * 
     * 
     * 
     * 
     * A network service can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockname">getsockname</a> function to determine the local address of the system.
     * @type {Pointer<SERVICE_ADDRESSES>}
     */
    lpServiceAddress {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>BLOB</b>
     * 
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-blob">BLOB</a> structure that specifies service-defined information. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  In general, the data pointed to by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-blob">BLOB</a> structure's <b>pBlobData</b> member must not contain any pointers. That is because only the network service knows the format of the data; copying the data without such knowledge would lead to pointer invalidation. If the data pointed to by <b>pBlobData</b> contains variable-sized elements, offsets from <b>pBlobData</b> can be used to indicate the location of those elements. There is one exception to this general rule: when <b>pBlobData</b> points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_info_absa">SERVICE_TYPE_INFO_ABS</a> structure. This is possible because both the 
     * <b>SERVICE_TYPE_INFO_ABS</b> structure, and any 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_value_absa">SERVICE_TYPE_VALUE_ABS</a> structures it contains are predefined, and thus their formats are known to the operating system.</div>
     * <div> </div>
     * @type {BLOB}
     */
    ServiceSpecificInfo{
        get {
            if(!this.HasProp("__ServiceSpecificInfo"))
                this.__ServiceSpecificInfo := BLOB(this.ptr + 64)
            return this.__ServiceSpecificInfo
        }
    }
}
