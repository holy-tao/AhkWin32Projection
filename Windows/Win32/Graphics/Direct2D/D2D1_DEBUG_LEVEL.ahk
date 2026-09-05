#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of information provided by the Direct2D Debug Layer.
 * @remarks
 * To receive debugging messages, you must install the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2ddebuglayer-overview">Direct2D Debug Layer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_debug_level
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_DEBUG_LEVEL extends Win32Enum {

    /**
     * Direct2D does not produce any debugging output.
     * Native name: D2D1_DEBUG_LEVEL_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Direct2D sends error messages to the debug layer.
     * Native name: D2D1_DEBUG_LEVEL_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 1

    /**
     * Direct2D sends error messages and warnings to the debug layer.
     * Native name: D2D1_DEBUG_LEVEL_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 2

    /**
     * Direct2D sends error messages, warnings, and additional diagnostic information that can help improve performance to the debug layer.
     * Native name: D2D1_DEBUG_LEVEL_INFORMATION
     * @type {Integer (Int32)}
     */
    static INFORMATION => 3
}
