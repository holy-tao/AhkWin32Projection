#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGEHLP_SYMBOL.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_SYMBOL_PACKAGE extends Win32Struct
{
    static sizeof => 2032

    static packingSize => 8

    /**
     * @type {IMAGEHLP_SYMBOL}
     */
    sym{
        get {
            if(!this.HasProp("__sym"))
                this.__sym := IMAGEHLP_SYMBOL(this.ptr + 0)
            return this.__sym
        }
    }

    /**
     * @type {Array<SByte>}
     */
    name{
        get {
            if(!this.HasProp("__nameProxyArray"))
                this.__nameProxyArray := Win32FixedArray(this.ptr + 24, 2001, Primitive, "char")
            return this.__nameProxyArray
        }
    }
}
