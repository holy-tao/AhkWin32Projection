#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how an InkEdit control appears on the screen.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-appearanceconstants
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class AppearanceConstants extends Win32Enum{

    /**
     * Flat. Paints without visual effects.
     * @type {Integer (Int32)}
     */
    static rtfFlat => 0

    /**
     * Default. 3D. Paints with three-dimensional effects.
     * @type {Integer (Int32)}
     */
    static rtfThreeD => 1
}
