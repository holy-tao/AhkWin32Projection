#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk

/**
 * The AMVAUncompDataInfo structure specifies the dimensions and pixel format of the uncompressed surfaces for DirectX Video Acceleration (DXVA) video decoding.
 * @see https://learn.microsoft.com/windows/win32/api/amva/ns-amva-amvauncompdatainfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVAUncompDataInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Width of the decoded, uncompressed data, in pixels.
     * @type {Integer}
     */
    dwUncompWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Height of the decoded, uncompressed data, in pixels.
     * @type {Integer}
     */
    dwUncompHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <b>DDPIXELFORMAT</b> structure that specifies the pixel format of the uncompressed data.
     * @type {DDPIXELFORMAT}
     */
    ddUncompPixelFormat{
        get {
            if(!this.HasProp("__ddUncompPixelFormat"))
                this.__ddUncompPixelFormat := DDPIXELFORMAT(8, this)
            return this.__ddUncompPixelFormat
        }
    }
}
