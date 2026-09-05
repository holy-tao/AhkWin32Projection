#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DSHADER_ADDRESSMODE_TYPE extends Win32Enum {

    /**
     * Native name: D3DSHADER_ADDRMODE_ABSOLUTE
     * @type {Integer (Int32)}
     */
    static ADDRMODE_ABSOLUTE => 0

    /**
     * Native name: D3DSHADER_ADDRMODE_RELATIVE
     * @type {Integer (Int32)}
     */
    static ADDRMODE_RELATIVE => 8192
}
