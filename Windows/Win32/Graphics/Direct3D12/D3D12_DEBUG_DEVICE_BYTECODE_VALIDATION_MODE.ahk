#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE extends Win32Enum {

    /**
     * Native name: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_WHEN_HASH_BYPASSED
     * @type {Integer (Int32)}
     */
    static WHEN_HASH_BYPASSED => 1

    /**
     * Native name: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_ALL_BYTECODE
     * @type {Integer (Int32)}
     */
    static ALL_BYTECODE => 2

    /**
     * Native name: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1
}
