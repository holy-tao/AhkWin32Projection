#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DEFRAG_ESCAPE_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_GET_FRAGMENTATION_STATS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_DEFRAG_UPWARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_DEFRAG_DOWNWARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_DEFRAG_PASS => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEFRAG_ESCAPE_VERIFY_TRANSFER => 4
}
