#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a call to ID3D12Device5::CheckDriverMatchingIdentifier which queries whether serialized data is compatible with the current device and driver version.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_driver_matching_identifier_status
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS extends Win32Enum{

    /**
     * Serialized data is compatible with the current device/driver.
     * @type {Integer (Int32)}
     */
    static D3D12_DRIVER_MATCHING_IDENTIFIER_COMPATIBLE_WITH_DEVICE => 0

    /**
     * The specified <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_serialized_data_type">D3D12_SERIALIZED_DATA_TYPE</a> specified is unknown or unsupported.
     * @type {Integer (Int32)}
     */
    static D3D12_DRIVER_MATCHING_IDENTIFIER_UNSUPPORTED_TYPE => 1

    /**
     * Format of the data in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier">D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER</a> is unrecognized.  This could indicate either corrupt data or the identifier was produced by a different hardware vendor.
     * @type {Integer (Int32)}
     */
    static D3D12_DRIVER_MATCHING_IDENTIFIER_UNRECOGNIZED => 2

    /**
     * Serialized data is recognized, but its version is not compatible with the current driver. This result may indicate that the device is from the same hardware vendor but is an incompatible version.
     * @type {Integer (Int32)}
     */
    static D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_VERSION => 3

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_serialized_data_type">D3D12_SERIALIZED_DATA_TYPE</a> specifies a data type that is not compatible with the type of serialized data.  As long as there is only a single defined serialized data type this error cannot not be produced.
     * @type {Integer (Int32)}
     */
    static D3D12_DRIVER_MATCHING_IDENTIFIER_INCOMPATIBLE_TYPE => 4
}
