#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DVS_ADDRESSMODE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DVS_ADDRMODE_ABSOLUTE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DVS_ADDRMODE_RELATIVE => 8192
}
