#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the copy mode used when calling ISpatialAudioMetadataCopier::CopyMetadataForFrames.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/ne-spatialaudiometadata-spatialaudiometadatacopymode
 * @namespace Windows.Win32.Media.Audio
 */
class SpatialAudioMetadataCopyMode extends Win32Enum {

    /**
     * Creates a direct copy of the number of metadata items  specified with the <i>copyFrameCount</i> parameter  into destination buffer, overwriting any previously existing data.
     * Native name: SpatialAudioMetadataCopy_Overwrite
     * @type {Integer (Int32)}
     */
    static Overwrite => 0

    /**
     * Performs an append operation which will fail if the  resulting <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitemsbuffer">ISpatialAudioMetadataItemsBuffer</a> has too many items.
     * Native name: SpatialAudioMetadataCopy_Append
     * @type {Integer (Int32)}
     */
    static Append => 1

    /**
     * Performs an append operation, and if overflow occurs, extra items are merged into last item, adopting last merged item's offset value.
     * Native name: SpatialAudioMetadataCopy_AppendMergeWithLast
     * @type {Integer (Int32)}
     */
    static AppendMergeWithLast => 2

    /**
     * Performs an append operation, and if overflow occurs, extra items are merged, assigning the offset to the offset of the first non-overflow item.
     * Native name: SpatialAudioMetadataCopy_AppendMergeWithFirst
     * @type {Integer (Int32)}
     */
    static AppendMergeWithFirst => 3
}
