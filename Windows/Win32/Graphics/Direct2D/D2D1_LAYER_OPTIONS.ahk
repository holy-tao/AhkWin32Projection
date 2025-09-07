#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options that can be applied when a layer resource is applied to create a layer.
 * @remarks
 * ClearType antialiasing must use the current contents of the render target to blend properly. When a pushed layer requests initializing for ClearType, Direct2D copies the current contents of the render target into the layer so that ClearType antialiasing can be performed. Rendering ClearType text into a transparent layer does not produce the desired results.
  * 
  * A small performance hit from re-copying content occurs when <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-clear(constd2d1_color_f_)">ID2D1RenderTarget::Clear</a> is called.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_layer_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_LAYER_OPTIONS{

    /**
     * The text in this layer does not use ClearType antialiasing.
     * @type {Integer (Int32)}
     */
    static D2D1_LAYER_OPTIONS_NONE => 0

    /**
     * The layer renders correctly for ClearType text. If the render target is set to ClearType, the  layer continues to render ClearType. If the render target is set to ClearType and this option is not specified, the render target will be set to render gray-scale until the layer is popped. The caller can override this default by calling <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-settextantialiasmode">SetTextAntialiasMode</a> while within the layer. This flag is slightly slower than the default.
     * @type {Integer (Int32)}
     */
    static D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE => 1
}
