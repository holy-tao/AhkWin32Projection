#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_COMMAND_PAYLOAD_REGISTERS extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    Payload {
        get {
            if(!this.HasProp("__PayloadProxyArray"))
                this.__PayloadProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
            return this.__PayloadProxyArray
        }
    }
}
