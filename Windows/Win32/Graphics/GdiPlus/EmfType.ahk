#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EmfType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EmfTypeEmfOnly => 3

    /**
     * @type {Integer (Int32)}
     */
    static EmfTypeEmfPlusOnly => 4

    /**
     * @type {Integer (Int32)}
     */
    static EmfTypeEmfPlusDual => 5
}
