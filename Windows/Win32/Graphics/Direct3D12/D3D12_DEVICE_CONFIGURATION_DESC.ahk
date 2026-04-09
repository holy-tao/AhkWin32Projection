#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DEVICE_FLAGS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEVICE_CONFIGURATION_DESC extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {D3D12_DEVICE_FLAGS}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    GpuBasedValidationFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SDKVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumEnabledExperimentalFeatures {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
