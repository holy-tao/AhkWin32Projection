#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICEDUMP_RESTRICTED_SUBSECTION extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    bData {
        get {
            if(!this.HasProp("__bDataProxyArray"))
                this.__bDataProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__bDataProxyArray
        }
    }
}
