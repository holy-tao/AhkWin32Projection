#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class CABINFOA extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {Pointer<PSTR>}
     */
    pszCab {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszInf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszSection {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Array<SByte>}
     */
    szSrcPath{
        get {
            if(!this.HasProp("__szSrcPathProxyArray"))
                this.__szSrcPathProxyArray := Win32FixedArray(this.ptr + 24, 260, Primitive, "char")
            return this.__szSrcPathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }
}
