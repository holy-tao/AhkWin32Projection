#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\COUNTED_REASON_CONTEXT.ahk" { COUNTED_REASON_CONTEXT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TIMER_SET_COALESCABLE_TIMER_INFO {
    #StructPack 8

    DueTime : Int64

    TimerApcRoutine : IntPtr

    TimerContext : IntPtr

    WakeContext : COUNTED_REASON_CONTEXT.Ptr

    Period : UInt32

    TolerableDelay : UInt32

    PreviousState : BOOLEAN.Ptr

}
