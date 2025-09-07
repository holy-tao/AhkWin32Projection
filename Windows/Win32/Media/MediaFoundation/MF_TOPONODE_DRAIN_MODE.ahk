#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines at what times a transform in a topology is drained.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_toponode_drain_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TOPONODE_DRAIN_MODE{

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
