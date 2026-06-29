#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a bitstream encryption type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_bitstream_encryption_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_BITSTREAM_ENCRYPTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The bistream is not encrypted.
     * @type {Integer (Int32)}
     */
    static D3D12_BITSTREAM_ENCRYPTION_TYPE_NONE => 0
}
