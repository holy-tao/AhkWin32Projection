#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about an ISpatialAudioMetadataItems object. Get a copy of this structure by calling GetInfo.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/ns-spatialaudiometadata-spatialaudiometadataitemsinfo
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioMetadataItemsInfo extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The total frame count, which defines valid item offsets.
     * @type {Integer}
     */
    FrameCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The current number of items stored.
     * @type {Integer}
     */
    ItemCount {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    MaxItemCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    MaxValueBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
