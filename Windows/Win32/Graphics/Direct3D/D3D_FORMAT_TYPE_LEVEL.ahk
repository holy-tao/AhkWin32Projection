#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_FORMAT_TYPE_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DFTL_NO_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DFTL_PARTIAL_TYPE => -2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFTL_FULL_TYPE => -1
}
