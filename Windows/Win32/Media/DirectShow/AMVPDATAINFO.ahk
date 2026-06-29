#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AMVPDIMINFO.ahk" { AMVPDIMINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The AMVPDATAINFO structure specifies the data-specific characteristics of the VP input stream.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ns-vptype-amvpdatainfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVPDATAINFO {
    #StructPack 4

    /**
     * Size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Time taken by each field.
     */
    dwMicrosecondsPerField : UInt32

    /**
     * Dimensional information.
     */
    amvpDimInfo : AMVPDIMINFO

    /**
     * The X dimension of picture aspect ratio.
     */
    dwPictAspectRatioX : UInt32

    /**
     * The Y dimension of picture aspect ratio.
     */
    dwPictAspectRatioY : UInt32

    /**
     * Video port should enable double clocking.
     */
    bEnableDoubleClock : BOOL

    /**
     * Video port should use an external VACT signal.
     */
    bEnableVACT : BOOL

    /**
     * Indicates that the signal is interlaced.
     */
    bDataIsInterlaced : BOOL

    /**
     * Number of half lines in the odd field.
     */
    lHalfLinesOdd : Int32

    /**
     * Video port should invert the field polarity.
     */
    bFieldPolarityInverted : BOOL

    /**
     * Number of lines of data in VREF.
     */
    dwNumLinesInVREF : UInt32

    /**
     * Number of half lines in the even field.
     */
    lHalfLinesEven : Int32

    /**
     * Reserved for future use.
     */
    dwReserved1 : UInt32

}
