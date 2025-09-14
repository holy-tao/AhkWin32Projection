#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SYMBOL_INFO.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class SYMBOL_INFO_PACKAGE extends Win32Struct
{
    static sizeof => 2096

    static packingSize => 8

    /**
     * @type {SYMBOL_INFO}
     */
    si{
        get {
            if(!this.HasProp("__si"))
                this.__si := SYMBOL_INFO(this.ptr + 0)
            return this.__si
        }
    }

    /**
     * @type {Array<SByte>}
     */
    name{
        get {
            if(!this.HasProp("__nameProxyArray"))
                this.__nameProxyArray := Win32FixedArray(this.ptr + 88, 2001, Primitive, "char")
            return this.__nameProxyArray
        }
    }
}
