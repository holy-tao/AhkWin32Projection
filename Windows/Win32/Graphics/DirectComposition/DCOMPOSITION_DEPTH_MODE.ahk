#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
class DCOMPOSITION_DEPTH_MODE extends Win32Enum {

    /**
     * Native name: DCOMPOSITION_DEPTH_MODE_TREE
     * @type {Integer (Int32)}
     */
    static TREE => 0

    /**
     * Native name: DCOMPOSITION_DEPTH_MODE_SPATIAL
     * @type {Integer (Int32)}
     */
    static SPATIAL => 1

    /**
     * Native name: DCOMPOSITION_DEPTH_MODE_SORTED
     * @type {Integer (Int32)}
     */
    static SORTED => 3

    /**
     * Native name: DCOMPOSITION_DEPTH_MODE_INHERIT
     * @type {Integer (Int32)}
     */
    static INHERIT => -1
}
