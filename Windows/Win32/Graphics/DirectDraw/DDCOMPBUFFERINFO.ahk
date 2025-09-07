#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS2.ahk
#Include .\DDPIXELFORMAT.ahk

/**
 * The DDCOMPBUFFERINFO structure contains driver-supplied information regarding compression buffers.
 * @remarks
 * This structure passes this information to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getmocompcompbuffdata">DD_GETMOCOMPCOMPBUFFDATA</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-ddcompbufferinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDCOMPBUFFERINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DDCOMPBUFFERINFO structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the number of surfaces of this type required for decompression.
     * @type {Integer}
     */
    dwNumCompBuffers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the width in pixels of the surface of this type to create.
     * @type {Integer}
     */
    dwWidthToCreate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Indicates the height in pixels of the surface of this type to create.
     * @type {Integer}
     */
    dwHeightToCreate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Indicates the total number of bytes used by each surface.
     * @type {Integer}
     */
    dwBytesToAllocate {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure that contains the capabilities to use when creating surfaces of this type. This allows the driver to specify the type of memory to use when creating these surfaces.
     * @type {DDSCAPS2}
     */
    ddCompCaps{
        get {
            if(!this.HasProp("__ddCompCaps"))
                this.__ddCompCaps := DDSCAPS2(this.ptr + 24)
            return this.__ddCompCaps
        }
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel formats to use when creating surfaces of this type.
     * @type {DDPIXELFORMAT}
     */
    ddPixelFormat{
        get {
            if(!this.HasProp("__ddPixelFormat"))
                this.__ddPixelFormat := DDPIXELFORMAT(this.ptr + 40)
            return this.__ddPixelFormat
        }
    }
}
