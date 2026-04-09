#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ACCESSRECTLIST.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk
#Include .\HEAPALIASINFO.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class ACCESSRECTLIST extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<ACCESSRECTLIST>}
     */
    lpLink {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {RECT}
     */
    rDest {
        get {
            if(!this.HasProp("__rDest"))
                this.__rDest := RECT(8, this)
            return this.__rDest
        }
    }

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpOwner {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpSurfaceData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<HEAPALIASINFO>}
     */
    lpHeapAliasInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
