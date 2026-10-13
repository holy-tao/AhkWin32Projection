#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DataDeduplication {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DEDUP_CHUNKLIB_MAX_CHUNKS_ENUM => 1024

    /**
     * @type {Guid}
     */
    static LIBID_DedupDataPort => Guid("{8f107207-1829-48b2-a64b-e61f8e0d9acb}")
;@endregion Constants

;@region Methods
;@endregion Methods
}
