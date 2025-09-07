#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\SERVICE_TYPE_VALUE_ABSA.ahk

/**
 * The SERVICE_TYPE_INFO_ABS structure contains information about a network service type. Use SERVICE_TYPE_INFO_ABS to add a network service type to a namespace. (ANSI)
 * @remarks
 * When you use the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/nf-nspapi-setservicea">SetService</a> function to add a network service type to a namespace, the 
  * <b>SERVICE_TYPE_INFO_ABS</b> structure is passed as the <b>ServiceSpecificInfo</b> BLOB member of a 
  * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_infoa">SERVICE_INFO</a> structure. Although the <b>ServiceSpecificInfo</b> member generally should not contain pointers, an exception is made in the case of the 
  * <b>SERVICE_TYPE_INFO_ABS</b> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_value_absa">SERVICE_TYPE_VALUE_ABS</a> structures.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The nspapi.h header defines SERVICE_TYPE_INFO_ABS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-service_type_info_absa
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset ANSI
 */
class SERVICE_TYPE_INFO_ABSA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a zero-terminated string that is the name of the network service type. This name is the same in all namespaces, and is used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/nf-nspapi-gettypebynamea">GetTypeByName</a> and 
     * <b>GetNameByType</b> functions.
     * @type {PSTR}
     */
    lpTypeName{
        get {
            if(!this.HasProp("__lpTypeName"))
                this.__lpTypeName := PSTR(this.ptr + 0)
            return this.__lpTypeName
        }
    }

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_value_absa">SERVICE_TYPE_VALUE_ABS</a> structures in the <b>Values</b> member array that follows <b>dwValueCount</b>.
     * @type {Integer}
     */
    dwValueCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_value_absa">SERVICE_TYPE_VALUE_ABS</a> structures. 
     * 
     * 
     * 
     * 
     * Each of these structures contains information about a service type value that the operating system or network service may need when an instance of this network service type is registered with a namespace.
     * 
     * The information in these structures may be specific to a namespace. For example, if a network service uses the SAP namespace, but does not have a <b>GUID</b> that contains the SAP identifier (SAPID), it defines the SAPID in a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_type_value_absa">SERVICE_TYPE_VALUE_ABS</a> structure.
     * @type {Array<SERVICE_TYPE_VALUE_ABSA>}
     */
    Values{
        get {
            if(!this.HasProp("__ValuesProxyArray"))
                this.__ValuesProxyArray := Win32FixedArray(this.ptr + 16, 8, SERVICE_TYPE_VALUE_ABSA, "")
            return this.__ValuesProxyArray
        }
    }
}
