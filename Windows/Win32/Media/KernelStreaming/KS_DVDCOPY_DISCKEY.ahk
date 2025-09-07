#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DVDCOPY_DISCKEY extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    DiscKey{
        get {
            if(!this.HasProp("__DiscKeyProxyArray"))
                this.__DiscKeyProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__DiscKeyProxyArray
        }
    }
}
