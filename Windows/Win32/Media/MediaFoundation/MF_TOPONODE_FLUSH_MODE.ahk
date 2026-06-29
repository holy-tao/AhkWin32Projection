#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines when a transform in a topology is flushed.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_toponode_flush_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TOPONODE_FLUSH_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The transform is flushed whenever the stream changes, including seeks and new segments.
     * @type {Integer (Int32)}
     */
    static MF_TOPONODE_FLUSH_ALWAYS => 0

    /**
     * The transform is flushed when seeking is performed on the stream.
     * @type {Integer (Int32)}
     */
    static MF_TOPONODE_FLUSH_SEEK => 1

    /**
     * The transform is never flushed during streaming. It is flushed only when the object is released.
     * @type {Integer (Int32)}
     */
    static MF_TOPONODE_FLUSH_NEVER => 2
}
