#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies a section within a Digital Video Broadcast (DVB) Event Information Table (EIT) section header. Because the EIT can be quite large, these options allow applications to reduce load time by filtering specific segments from the EIT section header.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dvb_eit_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DVB_EIT_FILTER_OPTIONS {
    #StructPack 4

    /**
     * If this flag is <b>TRUE</b>, the number of the segment that is queried from the header must match the value of the <b>bSegment</b> structure member. Otherwise, the segment field is ignored.
     */
    fSpecifySegment : BOOL

    /**
     * Specifies the segment within the EIT section header that is queried.
     */
    bSegment : Int8

}
