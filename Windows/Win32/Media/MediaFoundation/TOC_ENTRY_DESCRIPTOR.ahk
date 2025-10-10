#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TOC_ENTRY_DESCRIPTOR structure holds descriptive information for an entry in a table of contents.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/ns-wmcodecdsp-toc_entry_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class TOC_ENTRY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The start time, in 100-nanosecond units, of the portion of a media file represented by an entry in a table of contents.
     * @type {Integer}
     */
    qwStartTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The end time, in 100-nanosecond units, of the portion of a media file represented by an entry in a table of contents.
     * @type {Integer}
     */
    qwEndTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    qwStartPacketOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    qwEndPacketOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The presentation time, in 100-nanosecond units, of a frame that is a good representation of the entry. This frame could be used for a thumbnail image that represents the entry.
     * @type {Integer}
     */
    qwRepresentativeFrameTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
