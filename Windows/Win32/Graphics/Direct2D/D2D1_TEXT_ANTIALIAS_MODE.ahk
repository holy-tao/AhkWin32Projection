#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the antialiasing mode used for drawing text.
 * @remarks
 * 
  * This enumeration is used with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a> of an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> to specify how text and glyphs are antialiased.
  * 
  *  By default, Direct2D renders text in ClearType mode. Factors that 
  * 
  * can downgrade the default quality to grayscale or aliased:
  * 
  * <ul>
  * <li>If the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a> value  is <b>DWRITE_RENDERING_MODE_ALIASED </b>, then the 
  * 
  * default text antialiasing mode is aliased.  To change the DirectWrite rendering mode of an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a>, use the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextrenderingparams">ID2D1RenderTarget::SetTextRenderingParams</a> method. </li>
  * <li>If the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a> value is <b>DWRITE_RENDERING_MODE_OUTLINE</b>, then the default text 
  * 
  * antialiasing mode is grayscale.</li>
  * <li>If the render target has an alpha channel and is not set to <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_IGNORE</a>, then 
  * 
  * the default text antialiasing mode is grayscale.</li>
  * <li>If <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">ID2D1RenderTarget::PushLayer</a>  is called without <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_layer_options">D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE</a> 
  * 
  * (and the corresponding <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a> has not  been called yet), then the default text 
  * 
  * antialiasing mode is grayscale.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_text_antialias_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_TEXT_ANTIALIAS_MODE{

    /**
     * Use the system default. See Remarks.
     * @type {Integer (Int32)}
     */
    static D2D1_TEXT_ANTIALIAS_MODE_DEFAULT => 0

    /**
     * Use ClearType antialiasing.
     * @type {Integer (Int32)}
     */
    static D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE => 1

    /**
     * Use grayscale antialiasing.
     * @type {Integer (Int32)}
     */
    static D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE => 2

    /**
     * Do not use antialiasing.
     * @type {Integer (Int32)}
     */
    static D2D1_TEXT_ANTIALIAS_MODE_ALIASED => 3
}
