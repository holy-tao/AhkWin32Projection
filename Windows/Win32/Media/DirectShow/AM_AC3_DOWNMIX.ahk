#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_AC3_DOWNMIX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fDownMix{
        get {
            if(!this.HasProp("__fDownMix"))
                this.__fDownMix := BOOL(this.ptr + 0)
            return this.__fDownMix
        }
    }

    /**
     * @type {BOOL}
     */
    fDolbySurround{
        get {
            if(!this.HasProp("__fDolbySurround"))
                this.__fDolbySurround := BOOL(this.ptr + 4)
            return this.__fDolbySurround
        }
    }
}
