#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\DirectDraw\DDSCAPS2.ahk
#Include ..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk

/**
 * The AMVACompBufferInfo structure describes the allocated surfaces and compressed buffer information.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvacompbufferinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVACompBufferInfo extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * Number of buffers requested for compressed data.
     * @type {Integer}
     */
    dwNumCompBuffers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Width of surface to create.
     * @type {Integer}
     */
    dwWidthToCreate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Height of surface to create.
     * @type {Integer}
     */
    dwHeightToCreate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Total number of bytes used by each surface.
     * @type {Integer}
     */
    dwBytesToAllocate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * <b>DDSCAPS2</b> structure defining the capabilities of the DirectDraw surface created to store compressed data.
     * @type {DDSCAPS2}
     */
    ddCompCaps{
        get {
            if(!this.HasProp("__ddCompCaps"))
                this.__ddCompCaps := DDSCAPS2(16, this)
            return this.__ddCompCaps
        }
    }

    /**
     * <b>DDPIXELFORMAT</b> structure, describing the pixel format used to create surfaces to store compressed data.
     * @type {DDPIXELFORMAT}
     */
    ddPixelFormat{
        get {
            if(!this.HasProp("__ddPixelFormat"))
                this.__ddPixelFormat := DDPIXELFORMAT(32, this)
            return this.__ddPixelFormat
        }
    }
}
