#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk

/**
 * The DD_MOTIONCOMP_LOCAL structure contains local data for each individual Microsoft DirectDraw motion compensation object.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_motioncomp_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_MOTIONCOMP_LOCAL extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current DirectDraw process only.
     * @type {Pointer<DD_DIRECTDRAW_LOCAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies a GUID that describes the motion compensation process being used.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Indicates the width in pixels of the uncompressed output frame.
     * @type {Integer}
     */
    dwUncompWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates the height in pixels of the uncompressed output frame.
     * @type {Integer}
     */
    dwUncompHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel format of the uncompressed output frame.
     * @type {DDPIXELFORMAT}
     */
    ddUncompPixelFormat{
        get {
            if(!this.HasProp("__ddUncompPixelFormat"))
                this.__ddUncompPixelFormat := DDPIXELFORMAT(24, this)
            return this.__ddUncompPixelFormat
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Are reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    lpDriverReserved1 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    lpDriverReserved2 {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Are reserved for use by the display driver.
     * @type {Pointer<Void>}
     */
    lpDriverReserved3 {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
