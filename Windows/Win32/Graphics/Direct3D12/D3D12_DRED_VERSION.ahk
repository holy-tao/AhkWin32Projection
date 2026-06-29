#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a version of Device Removed Extended Data (DRED), as used by the D3D12_VERSIONED_DEVICE_REMOVED_EXTENDED_DATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_version
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies DRED version 1.0.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_VERSION_1_0 => 1

    /**
     * Specifies DRED version 1.1.
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_VERSION_1_1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_VERSION_1_2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DRED_VERSION_1_3 => 4
}
