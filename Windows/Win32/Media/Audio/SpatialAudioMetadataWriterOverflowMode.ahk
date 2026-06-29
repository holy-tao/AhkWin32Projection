#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the desired behavior when an ISpatialAudioMetadataWriter attempts to write more items into the metadata buffer than was specified when the client was initialized.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/ne-spatialaudiometadata-spatialaudiometadatawriteroverflowmode
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioMetadataWriterOverflowMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The write operation will fail.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataWriterOverflow_Fail => 0

    /**
     * The write operation will succeed, the overflow item will be merged with previous item and adopt the frame offset of newest item.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataWriterOverflow_MergeWithNew => 1

    /**
     * The write operation will succeed, the overflow item will be merged with previous item and keep the existing frame offset.
     * @type {Integer (Int32)}
     */
    static SpatialAudioMetadataWriterOverflow_MergeWithLast => 2
}
