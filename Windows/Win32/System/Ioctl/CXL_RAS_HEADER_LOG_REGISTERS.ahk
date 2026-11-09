#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_RAS_HEADER_LOG_REGISTERS extends Win32Struct {
    static sizeof => 64

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    HeaderLogArray {
        get {
            if(!this.HasProp("__HeaderLogArrayProxyArray"))
                this.__HeaderLogArrayProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "uint")
            return this.__HeaderLogArrayProxyArray
        }
    }
}
