#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Direct3D version of the resource used in the stream associated with a media type.
 * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/ne-mfd3d12-mf_mt_d3d_resource_version_enum
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MT_D3D_RESOURCE_VERSION_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The version is Direct3D 11.
     * @type {Integer (Int32)}
     */
    static MF_D3D11_RESOURCE => 0

    /**
     * The version is Direct3D 12.
     * @type {Integer (Int32)}
     */
    static MF_D3D12_RESOURCE => 1
}
