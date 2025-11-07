#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVAHD_COLOR_RGBA.ahk
#Include .\DXVAHD_COLOR_YCbCrA.ahk
#Include .\DXVAHD_COLOR.ahk

/**
 * Specifies the background color for blit operations, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * 
 * The background color is used to fill the target rectangle wherever no video image appears. Areas outside the target rectangle are not affected. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_target_rect_data">DXVAHD_BLT_STATE_TARGET_RECT_DATA</a>.
 * 
 * The color space of the background color is determined by the color space of the output. See <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_output_color_space_data">DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE_DATA</a>.
 * 
 * The alpha value of the background color is used only when the alpha fill mode is <b>DXVAHD_ALPHA_FILL_MODE_BACKGROUND</b>. Otherwise, the alpha value is ignored. See <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_alpha_fill_data">DXVAHD_BLT_STATE_ALPHA_FILL_DATA</a>.
 * 
 * The default background color is full-range RGB black, with opaque alpha.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_blt_state_background_color_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_BLT_STATE_BACKGROUND_COLOR_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * If <b>TRUE</b>, the <b>BackgroundColor</b> member specifies a YCbCr color. Otherwise, it specifies an RGB color.  The default device state is <b>FALSE</b> (RGB color).
     * @type {BOOL}
     */
    YCbCr {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_color">DXVAHD_COLOR</a> union that specifies the background color. The default state value is (0.0, 0.0, 0.0, 1.0).
     * @type {DXVAHD_COLOR}
     */
    BackgroundColor{
        get {
            if(!this.HasProp("__BackgroundColor"))
                this.__BackgroundColor := DXVAHD_COLOR(8, this)
            return this.__BackgroundColor
        }
    }
}
