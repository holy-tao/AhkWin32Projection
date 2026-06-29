#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEOINFOHEADER.ahk" { VIDEOINFOHEADER }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The MPEG1VIDEOINFO structure describes an MPEG-1 video stream.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-mpeg1videoinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MPEG1VIDEOINFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure.
     */
    hdr : VIDEOINFOHEADER

    /**
     * 25-bit group-of-pictures (GOP) time code at start of data.
     */
    dwStartTimeCode : UInt32

    /**
     * Length of the <b>bSequenceHeader</b> member, in bytes.
     */
    cbSequenceHeader : UInt32

    /**
     * Start of an array that contains the sequence header, including quantization matrices, if any. The size of the array is given in the <b>cbSequenceHeader</b> member.
     */
    bSequenceHeader : Int8[1]

}
