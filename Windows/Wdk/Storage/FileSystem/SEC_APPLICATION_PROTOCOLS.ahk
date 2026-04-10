#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an array of application protocol lists.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocols
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class SEC_APPLICATION_PROTOCOLS extends Win32Struct {
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
     * @type {Array<Pointer>}
     */
    ProtocolLists {
        get {
            if(!this.HasProp("__ProtocolListsProxyArray"))
                this.__ProtocolListsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__ProtocolListsProxyArray
        }
    }
}
