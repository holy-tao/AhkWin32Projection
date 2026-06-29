#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_VIDEO_COLOR_RGBA.ahk" { D3D11_VIDEO_COLOR_RGBA }
#Import ".\D3D11_VIDEO_COLOR_YCbCrA.ahk" { D3D11_VIDEO_COLOR_YCbCrA }

/**
 * Defines a color value for Microsoft Direct3D 11 video.
 * @remarks
 * The anonymous union can represent both RGB and YCbCr colors. The interpretation of the union depends on the context.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_COLOR {
    #StructPack 4

    YCbCr : D3D11_VIDEO_COLOR_YCbCrA

    static __New() {
        DefineProp(this.Prototype, 'RGBA', { type: D3D11_VIDEO_COLOR_RGBA, offset: 0 })
        this.DeleteProp("__New")
    }
}
