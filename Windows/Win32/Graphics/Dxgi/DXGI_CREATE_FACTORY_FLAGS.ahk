#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_CREATE_FACTORY_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DXGI_CREATE_FACTORY_DEBUG
     * @type {Integer (UInt32)}
     */
    static DEBUG => 1
}
