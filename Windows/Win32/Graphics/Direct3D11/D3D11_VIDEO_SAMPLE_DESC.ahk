#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk
#Include ..\Dxgi\Common\DXGI_FORMAT.ahk

/**
 * Describes a video sample.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_SAMPLE_DESC extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * The width of the video sample.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the video sample.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The format of the video sample.
     * @type {DXGI_FORMAT}
     */
    Format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The colorspace of the sample.
     * @type {DXGI_COLOR_SPACE_TYPE}
     */
    ColorSpace {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
