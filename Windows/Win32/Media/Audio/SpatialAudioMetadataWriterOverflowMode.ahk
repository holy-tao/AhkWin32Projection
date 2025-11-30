#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the desired behavior when an ISpatialAudioMetadataWriter attempts to write more items into the metadata buffer than was specified when the client was initialized.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/ne-spatialaudiometadata-spatialaudiometadatawriteroverflowmode
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioMetadataWriterOverflowMode extends Win32Enum{

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
