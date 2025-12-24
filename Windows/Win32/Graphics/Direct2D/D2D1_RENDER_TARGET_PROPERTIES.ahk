#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D1_PIXEL_FORMAT.ahk

/**
 * Contains rendering options (hardware or software), pixel format, DPI information, remoting options, and Direct3D support requirements for a render target.
 * @remarks
 * Use this structure when creating a render target, or use it with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-issupported(constd2d1_render_target_properties_)">ID2D1RenderTarget::IsSupported</a> method to check the properties supported by an existing render target.
 * 
 * As a convenience, Direct2D provides the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-rendertargetproperties">D2D1::RenderTargetProperties</a> helper function for creating <b>D2D1_RENDER_TARGET_PROPERTIES</b> structures. An easy way to create a <b>D2D1_RENDER_TARGET_PROPERTIES</b> structure that works for most render targets is to call the function without specifying any parameters. Doing so creates a <b>D2D1_RENDER_TARGET_PROPERTIES</b> structure that has its fields set to default values. For more information, see   <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-rendertargetproperties">D2D1::RenderTargetProperties</a>.
 * 
 * Not all render targets support hardware rendering. For a list, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/render-targets-overview">Render Targets Overview</a>.
 * 
 * <h3><a id="Using_Default_DPI_Settings"></a><a id="using_default_dpi_settings"></a><a id="USING_DEFAULT_DPI_SETTINGS"></a>Using Default DPI Settings</h3>
 * To use the default DPI, set <i>dpiX</i> and <i>dpiY</i> to 0. The default DPI varies depending on the render target:
 * 
 * <ul>
 * <li>For a compatible render target, the default DPI is the DPI of the parent render target.</li>
 * <li>For a <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a>, the default DPI is the system DPI obtained from the render target's <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>.</li>
 * <li>For other render targets, the default DPI is 96.</li>
 * </ul>
 * To use the default DPI setting, both <i>dpiX</i> and <i>dpiY</i> must be set to 0. Setting only one value to 0 causes an  <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">E_INVALIDARG</a> error when attempting to create a render target.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RENDER_TARGET_PROPERTIES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_type">D2D1_RENDER_TARGET_TYPE</a></b>
     * 
     * A value that specifies whether the render target should force hardware or software rendering. A value of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_type">D2D1_RENDER_TARGET_TYPE_DEFAULT</a> specifies that the render target should use hardware rendering if it is available; otherwise, it uses software rendering. Note that WIC bitmap render targets do not support hardware rendering.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a></b>
     * 
     * The pixel format and alpha mode of the render target. You can use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-pixelformat">D2D1::PixelFormat</a> function to create a pixel format that specifies that Direct2D should select the pixel format and alpha mode for you. For a list of pixel formats and alpha modes supported by each render target, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a>.
     * @type {D2D1_PIXEL_FORMAT}
     */
    pixelFormat{
        get {
            if(!this.HasProp("__pixelFormat"))
                this.__pixelFormat := D2D1_PIXEL_FORMAT(4, this)
            return this.__pixelFormat
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal DPI of the render target.  To use the default DPI, set <i>dpiX</i> and <i>dpiY</i> to 0. For more information, see the Remarks section.
     * @type {Float}
     */
    dpiX {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical DPI of the render target. To use the default DPI, set <i>dpiX</i> and <i>dpiY</i> to 0.  For more information, see the Remarks section.
     * @type {Float}
     */
    dpiY {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_usage">D2D1_RENDER_TARGET_USAGE</a></b>
     * 
     * A value that specifies how the render target is remoted and whether it should be GDI-compatible.  Set to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_usage">D2D1_RENDER_TARGET_USAGE_NONE</a> to create a render target that is not compatible with GDI and uses Direct3D command-stream remoting if it  is available.
     * @type {Integer}
     */
    usage {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_feature_level">D2D1_FEATURE_LEVEL</a></b>
     * 
     * A value that specifies the minimum Direct3D feature level required for hardware rendering. If the specified minimum level is not available, the render target uses software rendering if the <b>type </b> member is set to <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_type">D2D1_RENDER_TARGET_TYPE_DEFAULT</a>; if  <b>type </b> is set to to <b>D2D1_RENDER_TARGET_TYPE_HARDWARE</b>, render target creation fails. A value of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_feature_level">D2D1_FEATURE_LEVEL_DEFAULT</a> indicates that Direct2D should determine whether the Direct3D feature level of the device is adequate. This field is used only when creating <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1hwndrendertarget">ID2D1HwndRenderTarget</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1dcrendertarget">ID2D1DCRenderTarget</a> objects.
     * @type {Integer}
     */
    minLevel {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
