#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class EmfType extends Win32Enum {

    /**
     * Native name: EmfTypeEmfOnly
     * @type {Integer (Int32)}
     */
    static EmfOnly => 3

    /**
     * Native name: EmfTypeEmfPlusOnly
     * @type {Integer (Int32)}
     */
    static EmfPlusOnly => 4

    /**
     * Native name: EmfTypeEmfPlusDual
     * @type {Integer (Int32)}
     */
    static EmfPlusDual => 5
}
