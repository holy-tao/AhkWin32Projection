#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDMOCOMPBUFFERINFO structure contains the macro block information required to render a frame and passes this information to the DD_RENDERMOCOMPDATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-ddmocompbufferinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDMOCOMPBUFFERINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DDMOCOMPBUFFERINFO structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that contains the compressed data.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpCompSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Indicates the offset to the relevant data, in bytes, from the beginning of the buffer. This value does not allow for pitch.
     * @type {Integer}
     */
    dwDataOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates the size of the relevant data in bytes. This value does not allow for pitch.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Used by Microsoft DirectDraw and should be ignored by the driver.
     * @type {Pointer<Void>}
     */
    lpPrivate {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
