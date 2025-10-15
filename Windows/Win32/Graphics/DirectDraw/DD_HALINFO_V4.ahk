#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\VIDEOMEMORYINFO.ahk
#Include .\DDSCAPS.ahk
#Include .\DDNTCORECAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_HALINFO_V4 extends Win32Struct
{
    static sizeof => 432

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VIDEOMEMORYINFO}
     */
    vmiData{
        get {
            if(!this.HasProp("__vmiData"))
                this.__vmiData := VIDEOMEMORYINFO(this.ptr + 8)
            return this.__vmiData
        }
    }

    /**
     * @type {DDNTCORECAPS}
     */
    ddCaps{
        get {
            if(!this.HasProp("__ddCaps"))
                this.__ddCaps := DDNTCORECAPS(this.ptr + 96)
            return this.__ddCaps
        }
    }

    /**
     * @type {Pointer<PDD_GETDRIVERINFO>}
     */
    GetDriverInfo {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }
}
