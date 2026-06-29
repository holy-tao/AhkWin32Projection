#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG2VIDEOINFO_FLAGS.ahk" { MPEG2VIDEOINFO_FLAGS }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\VIDEOINFOHEADER2.ahk" { VIDEOINFOHEADER2 }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The MPEG2VIDEOINFO structure describes an MPEG-2 video stream.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure contained in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure (<b>hdr</b>) cannot be followed by any palette entries or color masks, because this structure is immediately followed by the <b>dwStartTimeCode</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-mpeg2videoinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MPEG2VIDEOINFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     */
    hdr : VIDEOINFOHEADER2

    /**
     * 25-bit group-of-pictures (GOP) time code at start of data. This field is not used for DVD.
     */
    dwStartTimeCode : UInt32

    /**
     * Length of the sequence header, in bytes. For DVD, set this field to zero. The sequence header is given in the <b>dwSequenceHeader</b> field.
     */
    cbSequenceHeader : UInt32

    /**
     * Specifies the MPEG-2 profile as an <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_mpeg2profile">AM_MPEG2Profile</a> enumeration type.
     */
    dwProfile : UInt32

    /**
     * Specifies the MPEG-2 level as an <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_mpeg2level">AM_MPEG2Level</a> enumeration type.
     */
    dwLevel : UInt32

    dwFlags : MPEG2VIDEOINFO_FLAGS

    /**
     * Start of an array that contains the sequence header, including quantization matrices and the sequence extension, if required. This field is typed as <b>DWORD</b> array to enforce 32-bit alignment. The size of the array, in bytes, is given in the <b>cbSequenceHeader</b> member.
     */
    dwSequenceHeader : UInt32[1]

}
