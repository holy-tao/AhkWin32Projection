#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the ASF indexer options.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-mfasf_indexer_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFASF_INDEXER_FLAGS extends Win32Enum {

    /**
     * The indexer creates a new index object.
     * Native name: MFASF_INDEXER_WRITE_NEW_INDEX
     * @type {Integer (Int32)}
     */
    static WRITE_NEW_INDEX => 1

    /**
     * The indexer returns values for reverse playback.
     * Native name: MFASF_INDEXER_READ_FOR_REVERSEPLAYBACK
     * @type {Integer (Int32)}
     */
    static READ_FOR_REVERSEPLAYBACK => 2

    /**
     * The indexer creates an index object for a live ASF stream.
     * Native name: MFASF_INDEXER_WRITE_FOR_LIVEREAD
     * @type {Integer (Int32)}
     */
    static WRITE_FOR_LIVEREAD => 4
}
