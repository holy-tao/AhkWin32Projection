#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DVSD_TOKENTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_NOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_STREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_STREAMDATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_TESSELLATOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_CONSTMEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_EXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DVSD_TOKEN_END => 7
}
