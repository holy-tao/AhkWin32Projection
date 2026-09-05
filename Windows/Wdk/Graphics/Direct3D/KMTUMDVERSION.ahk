#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class KMTUMDVERSION extends Win32Enum {

    /**
     * Native name: KMTUMDVERSION_DX9
     * @type {Integer (Int32)}
     */
    static DX9 => 0

    /**
     * Native name: KMTUMDVERSION_DX10
     * @type {Integer (Int32)}
     */
    static DX10 => 1

    /**
     * Native name: KMTUMDVERSION_DX11
     * @type {Integer (Int32)}
     */
    static DX11 => 2

    /**
     * Native name: KMTUMDVERSION_DX12
     * @type {Integer (Int32)}
     */
    static DX12 => 3

    /**
     * Native name: KMTUMDVERSION_DX12_WSA32
     * @type {Integer (Int32)}
     */
    static DX12_WSA32 => 4

    /**
     * Native name: KMTUMDVERSION_DX12_WSA64
     * @type {Integer (Int32)}
     */
    static DX12_WSA64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NUM_KMTUMDVERSIONS => 6
}
