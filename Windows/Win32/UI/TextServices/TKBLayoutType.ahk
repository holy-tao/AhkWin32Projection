#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TKBLayoutType enumeration are passed by an IME in a call to ITfFnGetPreferredTouchKeyboardLayout::GetLayout to specify the type of layout.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/ne-ctffunc-tkblayouttype
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TKBLayoutType extends Win32Enum{

    /**
     * Undefined. If specified, it will cause the layout to fallback to a classic layout.
     * @type {Integer (Int32)}
     */
    static TKBLT_UNDEFINED => 0

    /**
     * The touch keyboard is to use a classic layout.
     * @type {Integer (Int32)}
     */
    static TKBLT_CLASSIC => 1

    /**
     * The touch keyboard is to use a touch-optimized layout.
     * @type {Integer (Int32)}
     */
    static TKBLT_OPTIMIZED => 2
}
