#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT.ahk
#Include .\SEC_APPLICATION_PROTOCOL_LIST.ahk

/**
 * Stores an array of application protocol lists.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocols
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SEC_APPLICATION_PROTOCOLS extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

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
     * @type {SEC_APPLICATION_PROTOCOL_LIST}
     */
    ProtocolLists {
        get {
            if(!this.HasProp("__ProtocolListsProxyArray"))
                this.__ProtocolListsProxyArray := Win32FixedArray(this.ptr + 4, 1, SEC_APPLICATION_PROTOCOL_LIST, "")
            return this.__ProtocolListsProxyArray
        }
    }
}
