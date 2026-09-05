#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEVICE_FACTORY_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_DEVICE_FACTORY_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_DEVICE_FACTORY_FLAG_ALLOW_RETURNING_EXISTING_DEVICE
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_RETURNING_EXISTING_DEVICE => 1

    /**
     * Native name: D3D12_DEVICE_FACTORY_FLAG_ALLOW_RETURNING_INCOMPATIBLE_EXISTING_DEVICE
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_RETURNING_INCOMPATIBLE_EXISTING_DEVICE => 2

    /**
     * Native name: D3D12_DEVICE_FACTORY_FLAG_DISALLOW_STORING_NEW_DEVICE_AS_SINGLETON
     * @type {Integer (Int32)}
     */
    static FLAG_DISALLOW_STORING_NEW_DEVICE_AS_SINGLETON => 4
}
