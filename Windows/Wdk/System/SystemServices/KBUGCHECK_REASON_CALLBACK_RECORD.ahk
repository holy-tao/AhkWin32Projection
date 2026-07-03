#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KBUGCHECK_CALLBACK_REASON.ahk" { KBUGCHECK_CALLBACK_REASON }
#Import ".\PKBUGCHECK_REASON_CALLBACK_ROUTINE.ahk" { PKBUGCHECK_REASON_CALLBACK_ROUTINE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_REASON_CALLBACK_RECORD {
    #StructPack 8

    Entry : IntPtr

    CallbackRoutine : PKBUGCHECK_REASON_CALLBACK_ROUTINE

    Component : IntPtr

    Checksum : IntPtr

    Reason : KBUGCHECK_CALLBACK_REASON

    State : Int8

}
