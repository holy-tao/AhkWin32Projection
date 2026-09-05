#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEFRAG_ESCAPE_OPERATION extends Win32Enum {

    /**
     * Native name: D3DKMT_DEFRAG_ESCAPE_GET_FRAGMENTATION_STATS
     * @type {Integer (Int32)}
     */
    static GET_FRAGMENTATION_STATS => 0

    /**
     * Native name: D3DKMT_DEFRAG_ESCAPE_DEFRAG_UPWARD
     * @type {Integer (Int32)}
     */
    static DEFRAG_UPWARD => 1

    /**
     * Native name: D3DKMT_DEFRAG_ESCAPE_DEFRAG_DOWNWARD
     * @type {Integer (Int32)}
     */
    static DEFRAG_DOWNWARD => 2

    /**
     * Native name: D3DKMT_DEFRAG_ESCAPE_DEFRAG_PASS
     * @type {Integer (Int32)}
     */
    static DEFRAG_PASS => 3

    /**
     * Native name: D3DKMT_DEFRAG_ESCAPE_VERIFY_TRANSFER
     * @type {Integer (Int32)}
     */
    static VERIFY_TRANSFER => 4
}
