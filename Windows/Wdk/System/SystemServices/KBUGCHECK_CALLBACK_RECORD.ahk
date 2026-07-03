#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PKBUGCHECK_CALLBACK_ROUTINE.ahk" { PKBUGCHECK_CALLBACK_ROUTINE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_CALLBACK_RECORD {
    #StructPack 8

    Entry : IntPtr

    CallbackRoutine : PKBUGCHECK_CALLBACK_ROUTINE

    Buffer : IntPtr

    Length : UInt32

    Component : IntPtr

    Checksum : IntPtr

    State : Int8

}
