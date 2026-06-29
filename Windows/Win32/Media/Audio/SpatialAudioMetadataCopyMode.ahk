#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the copy mode used when calling ISpatialAudioMetadataCopier::CopyMetadataForFrames.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/ne-spatialaudiometadata-spatialaudiometadatacopymode
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioMetadataCopyMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Creates a direct copy of the number of metadata items  specified with the <i>copyFrameCount</i> parameter  into destination buffer, overwriting any previously existing data.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataCopy_Overwrite => 0

    /**
     * Performs an append operation which will fail if the  resulting <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitemsbuffer">ISpatialAudioMetadataItemsBuffer</a> has too many items.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataCopy_Append => 1

    /**
     * Performs an append operation, and if overflow occurs, extra items are merged into last item, adopting last merged item's offset value.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataCopy_AppendMergeWithLast => 2

    /**
     * Performs an append operation, and if overflow occurs, extra items are merged, assigning the offset to the offset of the first non-overflow item.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataCopy_AppendMergeWithFirst => 3
}
