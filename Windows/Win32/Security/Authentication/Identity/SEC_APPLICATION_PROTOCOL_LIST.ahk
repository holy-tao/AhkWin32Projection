#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT.ahk

/**
 * Stores a list of application protocols.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocol_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SEC_APPLICATION_PROTOCOL_LIST extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * The protocol negotiation extension type to use with this list of protocols.
     * @type {SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT}
     */
    ProtoNegoExt {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size (in bytes) of the protocol list.
     * @type {Integer}
     */
    ProtocolListSize {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * A list of 8-bit length-prefixed application protocol IDs, most preferred first.
     * @type {Array<Integer>}
     */
    ProtocolList {
        get {
            if(!this.HasProp("__ProtocolListProxyArray"))
                this.__ProtocolListProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__ProtocolListProxyArray
        }
    }
}
