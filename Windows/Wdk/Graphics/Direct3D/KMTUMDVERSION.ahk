#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class KMTUMDVERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX9 => 0

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX11 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX12 => 3

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX12_WSA32 => 4

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX12_WSA64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NUM_KMTUMDVERSIONS => 6
}
