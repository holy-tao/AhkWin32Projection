#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\KS_AMVPDIMINFO.ahk" { KS_AMVPDIMINFO }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_AMVPDATAINFO {
    #StructPack 4

    dwSize : UInt32

    dwMicrosecondsPerField : UInt32

    amvpDimInfo : KS_AMVPDIMINFO

    dwPictAspectRatioX : UInt32

    dwPictAspectRatioY : UInt32

    bEnableDoubleClock : BOOL

    bEnableVACT : BOOL

    bDataIsInterlaced : BOOL

    lHalfLinesOdd : Int32

    bFieldPolarityInverted : BOOL

    dwNumLinesInVREF : UInt32

    lHalfLinesEven : Int32

    dwReserved1 : UInt32

}
