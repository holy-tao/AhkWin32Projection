#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DVDCOPY_DISCKEY extends Win32Struct {
    static sizeof => 2048

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    DiscKey {
        get {
            if(!this.HasProp("__DiscKeyProxyArray"))
                this.__DiscKeyProxyArray := Win32FixedArray(this.ptr + 0, 2048, Primitive, "char")
            return this.__DiscKeyProxyArray
        }
    }
}
