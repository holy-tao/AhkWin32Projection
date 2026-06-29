#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about an ISpatialAudioMetadataItems object. Get a copy of this structure by calling GetInfo.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/ns-spatialaudiometadata-spatialaudiometadataitemsinfo
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioMetadataItemsInfo {
    #StructPack 4

    /**
     * The total frame count, which defines valid item offsets.
     */
    FrameCount : UInt16

    /**
     * The current number of items stored.
     */
    ItemCount : UInt16

    MaxItemCount : UInt16

    MaxValueBufferLength : UInt32

}
