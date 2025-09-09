#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_DVD_YUV.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_SPPAL extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Array<KS_DVD_YUV>}
     */
    sppal{
        get {
            if(!this.HasProp("__sppalProxyArray"))
                this.__sppalProxyArray := Win32FixedArray(this.ptr + 0, 16, KS_DVD_YUV, "")
            return this.__sppalProxyArray
        }
    }
}
