#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DEVICE_FLAGS.ahk" { D3D12_DEVICE_FLAGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEVICE_CONFIGURATION_DESC {
    #StructPack 4

    Flags : D3D12_DEVICE_FLAGS

    GpuBasedValidationFlags : UInt32

    SDKVersion : UInt32

    NumEnabledExperimentalFeatures : UInt32

}
