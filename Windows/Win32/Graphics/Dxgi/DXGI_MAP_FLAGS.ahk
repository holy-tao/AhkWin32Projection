#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MAP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MAP_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MAP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_MAP_DISCARD => 4
}
