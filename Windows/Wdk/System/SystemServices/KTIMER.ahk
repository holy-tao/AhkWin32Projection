#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\KDPC.ahk" { KDPC }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KTIMER {
    #StructPack 8

    Header : IntPtr

    DueTime : Int64

    TimerListEntry : IntPtr

    Dpc : KDPC.Ptr

    Period : UInt32

}
