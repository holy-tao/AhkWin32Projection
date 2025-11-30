#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DEVMODE_DUPLEX extends Win32Enum{

    /**
     * @type {Integer (Int16)}
     */
    static DMDUP_SIMPLEX => 1

    /**
     * @type {Integer (Int16)}
     */
    static DMDUP_VERTICAL => 2

    /**
     * @type {Integer (Int16)}
     */
    static DMDUP_HORIZONTAL => 3
}
