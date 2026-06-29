#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WMVIDEOINFOHEADER2.ahk" { WMVIDEOINFOHEADER2 }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The WMMPEG2VIDEOINFO structure describes an MPEG-2 video stream.
 * @remarks
 * This structure is identical to the <b>MPEG2VIDEOINFO</b> structure defined in Dvdmedia.h. For more information, see the DirectShow documentation in the DirectX SDK.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmmpeg2videoinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMMPEG2VIDEOINFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmvideoinfoheader2">WMVIDEOINFOHEADER2</a> structure giving header information.
     */
    hdr : WMVIDEOINFOHEADER2

    /**
     * 25-bit group-of-pictures (GOP) time code at start of data. This field is not used for DVD.
     */
    dwStartTimeCode : UInt32

    /**
     * Length of the sequence header, in bytes. For DVD, set this field to zero. The sequence header is given in the <b>dwSequenceHeader</b> field.
     */
    cbSequenceHeader : UInt32

    /**
     * <b>AM_MPEG2Profile</b> enumeration type that specifies the MPEG-2 profile.
     */
    dwProfile : UInt32

    /**
     * <b>AM_MPEG2Level</b> enumeration type that specifies the MPEG-2 level.
     */
    dwLevel : UInt32

    /**
     * Flag indicating preferences. Flags are defined in Dvdmedia.h.
     * 
     * Set undefined bits to zero or the connection will be rejected.
     */
    dwFlags : UInt32

    /**
     * Address of a buffer that contains the sequence header, including quantization matrices and the sequence extension, if required. This field is typed as a <b>DWORD</b> array to preserve the 32-bit alignment.
     */
    dwSequenceHeader : UInt32[1]

}
