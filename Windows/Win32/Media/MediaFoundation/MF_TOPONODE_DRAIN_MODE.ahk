#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines at what times a transform in a topology is drained.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_toponode_drain_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TOPONODE_DRAIN_MODE extends Win32Enum {

    /**
     * The transform is drained when the end of a stream is reached. It is not drained when markout is reached at the end of a segment.
     * Native name: MF_TOPONODE_DRAIN_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * The transform is drained whenever a topology ends.
     * Native name: MF_TOPONODE_DRAIN_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 1

    /**
     * The transform is never drained.
     * Native name: MF_TOPONODE_DRAIN_NEVER
     * @type {Integer (Int32)}
     */
    static NEVER => 2
}
