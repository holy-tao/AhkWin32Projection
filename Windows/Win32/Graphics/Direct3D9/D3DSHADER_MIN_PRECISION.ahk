#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSHADER_MIN_PRECISION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DMP_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DMP_16 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DMP_2_8 => 2
}
