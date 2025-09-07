#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Devices\Display\FD_KERNINGPAIR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class KERNDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwKernPairNum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<FD_KERNINGPAIR>}
     */
    KernPair{
        get {
            if(!this.HasProp("__KernPairProxyArray"))
                this.__KernPairProxyArray := Win32FixedArray(this.ptr + 8, 8, FD_KERNINGPAIR, "")
            return this.__KernPairProxyArray
        }
    }
}
