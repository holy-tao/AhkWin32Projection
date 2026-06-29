#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE {
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
    static D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_FIELD_BASED => 1
}
