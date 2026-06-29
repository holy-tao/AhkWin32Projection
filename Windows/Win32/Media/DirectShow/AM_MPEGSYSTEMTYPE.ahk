#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import ".\AM_MPEGSTREAMTYPE.ahk" { AM_MPEGSTREAMTYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The AM_MPEGSYSTEMTYPE structure defines the format block for an MPEG-1 system stream.
 * @remarks
 * The <b>Streams</b> member contains a list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpegtype/ns-mpegtype-am_mpegstreamtype">AM_MPEGSTREAMTYPE</a> structures. The size of each <b>AM_MPEGSTREAMTYPE</b> structure is aligned to an 8-byte boundary. Given a pointer to an <b>AM_MPEGSTREAMTYPE</b> structure in list, use the <b>AM_MPEGSTREAMTYPE_NEXT</b> macro to get a pointer to the next structure.
 * @see https://learn.microsoft.com/windows/win32/api/mpegtype/ns-mpegtype-am_mpegsystemtype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_MPEGSYSTEMTYPE {
    #StructPack 8

    /**
     * Bits per second.
     */
    dwBitRate : UInt32

    /**
     * Number of streams.
     */
    cStreams : UInt32

    /**
     * List <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpegtype/ns-mpegtype-am_mpegstreamtype">AM_MPEGSTREAMTYPE</a> structures that describe the elementary streams. The number of elements in the list is given by the <b>cStream</b> member. The size of each <b>AM_MPEGSTREAMTYPE</b> structure is variable. Use the <b>AM_MPEGSTREAMTYPE_ELEMENTLENGTH</b> macro to calculate the size of each structure.
     */
    Streams : AM_MPEGSTREAMTYPE[1]

}
