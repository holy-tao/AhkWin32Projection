#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of information provided by the Direct2D Debug Layer.
 * @remarks
 * 
 * To receive debugging messages, you must install the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2ddebuglayer-overview">Direct2D Debug Layer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_debug_level
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DEBUG_LEVEL{

    /**
     * Direct2D does not produce any debugging output.
     * @type {Integer (Int32)}
     */
    static D2D1_DEBUG_LEVEL_NONE => 0

    /**
     * Direct2D sends error messages to the debug layer.
     * @type {Integer (Int32)}
     */
    static D2D1_DEBUG_LEVEL_ERROR => 1

    /**
     * Direct2D sends error messages and warnings to the debug layer.
     * @type {Integer (Int32)}
     */
    static D2D1_DEBUG_LEVEL_WARNING => 2

    /**
     * Direct2D sends error messages, warnings, and additional diagnostic information that can help improve performance to the debug layer.
     * @type {Integer (Int32)}
     */
    static D2D1_DEBUG_LEVEL_INFORMATION => 3
}
