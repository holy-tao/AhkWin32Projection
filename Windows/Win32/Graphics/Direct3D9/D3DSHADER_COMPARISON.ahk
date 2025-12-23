#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSHADER_COMPARISON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_RESERVED0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_GT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_EQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_GE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_LT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_NE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_LE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPC_RESERVED1 => 7
}
