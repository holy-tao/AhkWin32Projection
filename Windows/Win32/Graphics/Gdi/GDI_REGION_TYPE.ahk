#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GDI_REGION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RGN_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static NULLREGION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIMPLEREGION => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMPLEXREGION => 3
}
