#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies additional features supportable by a compatible render target when it is created. This enumeration allows a bitwise combination of its member values.
 * @remarks
 * Use this enumeration when creating a compatible render target with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createcompatiblerendertarget(constd2d1_size_f_constd2d1_size_u_constd2d1_pixel_format_d2d1_compatible_render_target_options_id2d1bitmaprendertarget)">CreateCompatibleRenderTarget</a> method. For more information about compatible render targets, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/render-targets-overview">Render Targets Overview</a>. 
 * 
 * The <b>D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE</b> option may only be requested if the parent render target was created with <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_render_target_usage">D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE</a> (for most render targets) or <b>D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE</b> (for render targets created by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createcompatiblerendertarget(constd2d1_size_f_constd2d1_size_u_constd2d1_pixel_format_d2d1_compatible_render_target_options_id2d1bitmaprendertarget)">CreateCompatibleRenderTarget</a> method).
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_compatible_render_target_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS extends Win32BitflagEnum{

    /**
     * The render target supports no additional features.
     * @type {Integer (Int32)}
     */
    static D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE => 0

    /**
     * The render target supports interoperability with the Windows Graphics Device Interface  (GDI).
     * @type {Integer (Int32)}
     */
    static D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE => 1
}
