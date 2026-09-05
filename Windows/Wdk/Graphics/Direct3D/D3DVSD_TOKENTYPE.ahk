#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DVSD_TOKENTYPE extends Win32Enum {

    /**
     * Native name: D3DVSD_TOKEN_NOP
     * @type {Integer (Int32)}
     */
    static TOKEN_NOP => 0

    /**
     * Native name: D3DVSD_TOKEN_STREAM
     * @type {Integer (Int32)}
     */
    static TOKEN_STREAM => 1

    /**
     * Native name: D3DVSD_TOKEN_STREAMDATA
     * @type {Integer (Int32)}
     */
    static TOKEN_STREAMDATA => 2

    /**
     * Native name: D3DVSD_TOKEN_TESSELLATOR
     * @type {Integer (Int32)}
     */
    static TOKEN_TESSELLATOR => 3

    /**
     * Native name: D3DVSD_TOKEN_CONSTMEM
     * @type {Integer (Int32)}
     */
    static TOKEN_CONSTMEM => 4

    /**
     * Native name: D3DVSD_TOKEN_EXT
     * @type {Integer (Int32)}
     */
    static TOKEN_EXT => 5

    /**
     * Native name: D3DVSD_TOKEN_END
     * @type {Integer (Int32)}
     */
    static TOKEN_END => 7
}
