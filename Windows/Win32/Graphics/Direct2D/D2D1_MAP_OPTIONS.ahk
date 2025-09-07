#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the memory to be mapped from the corresponding ID2D1Bitmap1 should be treated.
 * @remarks
 * The <b>D2D1_MAP_OPTIONS_READ</b> option can be used only if the bitmap was created with the <b>D2D1_BITMAP_OPTIONS_CPU_READ</b> flag.
  * 
  * These flags will be not be able to be used on bitmaps created by the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a>. However, the ID2D1SourceTransform will receive bitmaps for which these flags are valid.
  * 
  * <b>D2D1_MAP_OPTIONS_DISCARD</b> can only be used with <b>D2D1_MAP_OPTIONS_WRITE</b>.  Both of these options are only available through the effect author API, not through the Direct2D rendering API.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_map_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_MAP_OPTIONS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D2D1_MAP_OPTIONS_NONE => 0

    /**
     * Allow CPU Read access.
     * @type {Integer (Int32)}
     */
    static D2D1_MAP_OPTIONS_READ => 1

    /**
     * Allow CPU Write access.
     * @type {Integer (Int32)}
     */
    static D2D1_MAP_OPTIONS_WRITE => 2

    /**
     * Discard the previous contents of the resource when it is mapped.
     * @type {Integer (Int32)}
     */
    static D2D1_MAP_OPTIONS_DISCARD => 4
}
