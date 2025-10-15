#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_SETMODEDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwModeIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Pointer<LPDDHAL_SETMODE>}
     */
    SetMode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    inexcl{
        get {
            if(!this.HasProp("__inexcl"))
                this.__inexcl := BOOL(this.ptr + 24)
            return this.__inexcl
        }
    }

    /**
     * @type {BOOL}
     */
    useRefreshRate{
        get {
            if(!this.HasProp("__useRefreshRate"))
                this.__useRefreshRate := BOOL(this.ptr + 28)
            return this.__useRefreshRate
        }
    }
}
