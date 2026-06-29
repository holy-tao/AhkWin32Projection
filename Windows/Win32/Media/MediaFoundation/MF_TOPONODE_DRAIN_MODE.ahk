#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines at what times a transform in a topology is drained.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_toponode_drain_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TOPONODE_DRAIN_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The transform is drained when the end of a stream is reached. It is not drained when markout is reached at the end of a segment.
     * @type {Integer (Int32)}
     */
    static MF_TOPONODE_DRAIN_DEFAULT => 0

    /**
     * The transform is drained whenever a topology ends.
     * @type {Integer (Int32)}
     */
    static MF_TOPONODE_DRAIN_ALWAYS => 1

    /**
     * The transform is never drained.
     * @type {Integer (Int32)}
     */
    static MF_TOPONODE_DRAIN_NEVER => 2
}
