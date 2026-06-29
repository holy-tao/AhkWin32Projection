#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of serialized data. Use a value from this enumeration when calling ID3D12Device5::CheckDriverMatchingIdentifier.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_serialized_data_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SERIALIZED_DATA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The serialized data is a raytracing acceleration structure.
     * @type {Integer (Int32)}
     */
    static D3D12_SERIALIZED_DATA_RAYTRACING_ACCELERATION_STRUCTURE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SERIALIZED_DATA_APPLICATION_SPECIFIC_DRIVER_STATE => 1
}
