#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DRAWEDGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_RAISEDOUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_SUNKENOUTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_RAISEDINNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_SUNKENINNER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_OUTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_INNER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_RAISED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BDR_SUNKEN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_RAISED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_SUNKEN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_ETCHED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EDGE_BUMP => 9
}
