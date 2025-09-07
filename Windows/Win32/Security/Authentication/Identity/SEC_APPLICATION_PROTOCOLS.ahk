#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SEC_APPLICATION_PROTOCOL_LIST.ahk

/**
 * Stores an array of application protocol lists.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocols
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_APPLICATION_PROTOCOLS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size (in bytes) of the protocol ID lists array.
     * @type {Integer}
     */
    ProtocolListsSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of protocol ID lists.
     * @type {Array<SEC_APPLICATION_PROTOCOL_LIST>}
     */
    ProtocolLists{
        get {
            if(!this.HasProp("__ProtocolListsProxyArray"))
                this.__ProtocolListsProxyArray := Win32FixedArray(this.ptr + 8, 8, SEC_APPLICATION_PROTOCOL_LIST, "")
            return this.__ProtocolListsProxyArray
        }
    }
}
