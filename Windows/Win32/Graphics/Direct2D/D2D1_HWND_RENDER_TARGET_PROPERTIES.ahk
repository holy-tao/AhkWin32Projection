#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include Common\D2D_SIZE_U.ahk

/**
 * Contains the HWND, pixel size, and presentation options for an ID2D1HwndRenderTarget.
 * @remarks
 * Use this structure when you call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createhwndrendertarget(constd2d1_render_target_properties_constd2d1_hwnd_render_target_properties_id2d1hwndrendertarget)">CreateHwndRenderTarget</a> method to create a new <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a>.
 * 
 * For convenience, Direct2D provides the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-hwndrendertargetproperties">D2D1::HwndRenderTargetProperties</a> function for creating new <b>D2D1_HWND_RENDER_TARGET_PROPERTIES</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_hwnd_render_target_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HWND_RENDER_TARGET_PROPERTIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>HWND</b>
     * 
     * The HWND to which the render target issues the output from its drawing commands.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-size-u">D2D1_SIZE_U</a></b>
     * 
     * The size of the render target, in pixels.
     * @type {D2D_SIZE_U}
     */
    pixelSize{
        get {
            if(!this.HasProp("__pixelSize"))
                this.__pixelSize := D2D_SIZE_U(8, this)
            return this.__pixelSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_present_options">D2D1_PRESENT_OPTIONS</a></b>
     * 
     * A value that specifies whether the render target retains the frame after it is presented and whether the render target waits for the device to refresh before presenting.
     * @type {Integer}
     */
    presentOptions {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
