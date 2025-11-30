#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRED_DEVICE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_HUNG => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_FAULT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_DEVICE_STATE_PAGEFAULT => 7
}
