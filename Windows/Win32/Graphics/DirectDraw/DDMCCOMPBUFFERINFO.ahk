#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS2.ahk
#Include .\DDPIXELFORMAT.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDMCCOMPBUFFERINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwNumCompBuffers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwWidthToCreate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwHeightToCreate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwBytesToAllocate {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {DDSCAPS2}
     */
    ddCompCaps{
        get {
            if(!this.HasProp("__ddCompCaps"))
                this.__ddCompCaps := DDSCAPS2(24, this)
            return this.__ddCompCaps
        }
    }

    /**
     * @type {DDPIXELFORMAT}
     */
    ddPixelFormat{
        get {
            if(!this.HasProp("__ddPixelFormat"))
                this.__ddPixelFormat := DDPIXELFORMAT(40, this)
            return this.__ddPixelFormat
        }
    }
}
