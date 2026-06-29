#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TOC_ENTRY_DESCRIPTOR structure holds descriptive information for an entry in a table of contents.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ns-wmcodecdsp-toc_entry_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct TOC_ENTRY_DESCRIPTOR {
    #StructPack 8

    /**
     * The start time, in 100-nanosecond units, of the portion of a media file represented by an entry in a table of contents.
     */
    qwStartTime : Int64

    /**
     * The end time, in 100-nanosecond units, of the portion of a media file represented by an entry in a table of contents.
     */
    qwEndTime : Int64

    /**
     * Not used.
     */
    qwStartPacketOffset : Int64

    /**
     * Not used.
     */
    qwEndPacketOffset : Int64

    /**
     * The presentation time, in 100-nanosecond units, of a frame that is a good representation of the entry. This frame could be used for a thumbnail image that represents the entry.
     */
    qwRepresentativeFrameTime : Int64

}
