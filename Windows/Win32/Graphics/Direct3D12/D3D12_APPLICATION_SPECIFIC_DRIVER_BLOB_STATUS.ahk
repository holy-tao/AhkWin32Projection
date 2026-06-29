#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_UNKNOWN => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_USED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_IGNORED => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_NOT_SPECIFIED => 4
}
