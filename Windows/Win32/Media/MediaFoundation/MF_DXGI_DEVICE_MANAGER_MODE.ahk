#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_DXGI_DEVICE_MANAGER_MODE extends Win32Enum {

    /**
     * Native name: MF_DXGI_DEVICE_MANAGER_MODE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: MF_DXGI_DEVICE_MANAGER_MODE_D3D11
     * @type {Integer (Int32)}
     */
    static D3D11 => 1

    /**
     * Native name: MF_DXGI_DEVICE_MANAGER_MODE_D3D12
     * @type {Integer (Int32)}
     */
    static D3D12 => 2
}
