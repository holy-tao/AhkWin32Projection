#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_DEPTH_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_TREE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_SPATIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_SORTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_DEPTH_MODE_INHERIT => -1
}
