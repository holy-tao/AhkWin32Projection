#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_WHEN_HASH_BYPASSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_ALL_BYTECODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE_DEFAULT => 1
}
