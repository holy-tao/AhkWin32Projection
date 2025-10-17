#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_ANIM_UPDATE_PARMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(8, this)
            return this.__rc
        }
    }

    /**
     * @type {HDC}
     */
    hDC{
        get {
            if(!this.HasProp("__hDC"))
                this.__hDC := HDC(24, this)
            return this.__hDC
        }
    }
}
