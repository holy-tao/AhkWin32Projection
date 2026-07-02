#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDRIVER_VERIFIER_THUNK_ROUTINE.ahk" { PDRIVER_VERIFIER_THUNK_ROUTINE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DRIVER_VERIFIER_THUNK_PAIRS {
    #StructPack 8

    PristineRoutine : PDRIVER_VERIFIER_THUNK_ROUTINE

    NewRoutine : PDRIVER_VERIFIER_THUNK_ROUTINE

}
