#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD32BITDRIVERDATA extends Win32Struct
{
    static sizeof => 328

    static packingSize => 4

    /**
     * @type {Array<SByte>}
     */
    szName{
        get {
            if(!this.HasProp("__szNameProxyArray"))
                this.__szNameProxyArray := Win32FixedArray(this.ptr + 0, 260, Primitive, "char")
            return this.__szNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szEntryPoint{
        get {
            if(!this.HasProp("__szEntryPointProxyArray"))
                this.__szEntryPointProxyArray := Win32FixedArray(this.ptr + 260, 64, Primitive, "char")
            return this.__szEntryPointProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwContext {
        get => NumGet(this, 324, "uint")
        set => NumPut("uint", value, this, 324)
    }
}
