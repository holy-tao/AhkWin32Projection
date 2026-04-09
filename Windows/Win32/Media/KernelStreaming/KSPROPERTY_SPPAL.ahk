#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_DVD_YUV.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_SPPAL extends Win32Struct {
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {KS_DVD_YUV}
     */
    sppal {
        get {
            if(!this.HasProp("__sppalProxyArray"))
                this.__sppalProxyArray := Win32FixedArray(this.ptr + 0, 16, KS_DVD_YUV, "")
            return this.__sppalProxyArray
        }
    }
}
