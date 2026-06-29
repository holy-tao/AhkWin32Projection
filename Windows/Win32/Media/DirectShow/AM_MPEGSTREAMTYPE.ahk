#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The AM_MPEGSTREAMTYPE structure defines the media type for an MPEG-1 program stream.
 * @see https://learn.microsoft.com/windows/win32/api/mpegtype/ns-mpegtype-am_mpegstreamtype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_MPEGSTREAMTYPE {
    #StructPack 8

    /**
     * Stream identifier of the stream to process.
     */
    dwStreamId : UInt32

    /**
     * Reserved.
     */
    dwReserved : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure describing the type for the substeam. The <b>pbFormat</b> member of this structure must <b>NULL</b>. The format data normally conveyed in <b>pbFormat</b> is stored in the <b>bFormat</b> member.
     */
    mt : AM_MEDIA_TYPE

    /**
     * Format data. The size of this array, in bytes, is given in the <b>mt.cbFormat</b> member.
     */
    bFormat : Int8[1]

}
