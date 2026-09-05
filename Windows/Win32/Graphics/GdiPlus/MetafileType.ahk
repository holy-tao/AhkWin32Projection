#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class MetafileType extends Win32Enum {

    /**
     * Native name: MetafileTypeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: MetafileTypeWmf
     * @type {Integer (Int32)}
     */
    static Wmf => 1

    /**
     * Native name: MetafileTypeWmfPlaceable
     * @type {Integer (Int32)}
     */
    static WmfPlaceable => 2

    /**
     * Native name: MetafileTypeEmf
     * @type {Integer (Int32)}
     */
    static Emf => 3

    /**
     * Native name: MetafileTypeEmfPlusOnly
     * @type {Integer (Int32)}
     */
    static EmfPlusOnly => 4

    /**
     * Native name: MetafileTypeEmfPlusDual
     * @type {Integer (Int32)}
     */
    static EmfPlusDual => 5
}
