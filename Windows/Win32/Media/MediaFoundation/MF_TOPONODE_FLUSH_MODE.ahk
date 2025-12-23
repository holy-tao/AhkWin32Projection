#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines when a transform in a topology is flushed.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_toponode_flush_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TOPONODE_FLUSH_MODE extends Win32Enum{

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
