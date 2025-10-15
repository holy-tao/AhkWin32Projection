#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DSCFXAec extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fEnable{
        get {
            if(!this.HasProp("__fEnable"))
                this.__fEnable := BOOL(this.ptr + 0)
            return this.__fEnable
        }
    }

    /**
     * @type {BOOL}
     */
    fNoiseFill{
        get {
            if(!this.HasProp("__fNoiseFill"))
                this.__fNoiseFill := BOOL(this.ptr + 4)
            return this.__fNoiseFill
        }
    }

    /**
     * @type {Integer}
     */
    dwMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
