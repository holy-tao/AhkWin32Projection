#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_VIDEO_COLOR_YCbCrA.ahk
#Include .\D3D11_VIDEO_COLOR_RGBA.ahk

/**
 * Defines a color value for Microsoft Direct3D 11 video.
 * @remarks
 * 
 * The anonymous union can represent both RGB and YCbCr colors. The interpretation of the union depends on the context.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_color
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_COLOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3D11_VIDEO_COLOR_YCbCrA}
     */
    YCbCr{
        get {
            if(!this.HasProp("__YCbCr"))
                this.__YCbCr := D3D11_VIDEO_COLOR_YCbCrA(0, this)
            return this.__YCbCr
        }
    }

    /**
     * @type {D3D11_VIDEO_COLOR_RGBA}
     */
    RGBA{
        get {
            if(!this.HasProp("__RGBA"))
                this.__RGBA := D3D11_VIDEO_COLOR_RGBA(0, this)
            return this.__RGBA
        }
    }
}
