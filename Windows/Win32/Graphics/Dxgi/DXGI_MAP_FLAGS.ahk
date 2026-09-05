#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_MAP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DXGI_MAP_READ
     * @type {Integer (UInt32)}
     */
    static READ => 1

    /**
     * Native name: DXGI_MAP_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 2

    /**
     * Native name: DXGI_MAP_DISCARD
     * @type {Integer (UInt32)}
     */
    static DISCARD => 4
}
