#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class VBICODECFILTERING_NABTS_SUBSTREAMS extends Win32Struct {
    static sizeof => 512

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    SubstreamMask {
        get {
            if(!this.HasProp("__SubstreamMaskProxyArray"))
                this.__SubstreamMaskProxyArray := Win32FixedArray(this.ptr + 0, 128, Primitive, "uint")
            return this.__SubstreamMaskProxyArray
        }
    }
}
