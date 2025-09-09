#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class VBICODECFILTERING_SCANLINES extends Win32Struct
{
    static sizeof => 128

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    DwordBitArray{
        get {
            if(!this.HasProp("__DwordBitArrayProxyArray"))
                this.__DwordBitArrayProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "uint")
            return this.__DwordBitArrayProxyArray
        }
    }
}
