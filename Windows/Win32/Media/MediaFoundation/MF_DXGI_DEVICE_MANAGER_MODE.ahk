#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_DXGI_DEVICE_MANAGER_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_DXGI_DEVICE_MANAGER_MODE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_DXGI_DEVICE_MANAGER_MODE_D3D11 => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_DXGI_DEVICE_MANAGER_MODE_D3D12 => 2
}
