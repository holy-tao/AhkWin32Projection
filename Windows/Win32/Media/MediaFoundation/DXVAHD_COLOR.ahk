#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVAHD_COLOR_YCbCrA.ahk" { DXVAHD_COLOR_YCbCrA }
#Import ".\DXVAHD_COLOR_RGBA.ahk" { DXVAHD_COLOR_RGBA }

/**
 * Defines a color value for DXVA-HD.
 * @remarks
 * This union can represent both RGB and YCbCr colors. The interpretation of the union depends on the context.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_color
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_COLOR {
    #StructPack 4

    /**
     * A [DXVAHD_COLOR_RGBA](./ns-dxvahd-dxvahd_color_rgba.md) structure that contains an RGB color value.
     */
    RGB : DXVAHD_COLOR_RGBA

    static __New() {
        DefineProp(this.Prototype, 'YCbCr', { type: DXVAHD_COLOR_YCbCrA, offset: 0 })
        this.DeleteProp("__New")
    }
}
