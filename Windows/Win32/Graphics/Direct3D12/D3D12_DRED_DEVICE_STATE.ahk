#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DRED_DEVICE_STATE extends Win32Enum {

    /**
     * Native name: D3D12_DRED_DEVICE_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: D3D12_DRED_DEVICE_STATE_HUNG
     * @type {Integer (Int32)}
     */
    static HUNG => 3

    /**
     * Native name: D3D12_DRED_DEVICE_STATE_FAULT
     * @type {Integer (Int32)}
     */
    static FAULT => 6

    /**
     * Native name: D3D12_DRED_DEVICE_STATE_PAGEFAULT
     * @type {Integer (Int32)}
     */
    static PAGEFAULT => 7
}
