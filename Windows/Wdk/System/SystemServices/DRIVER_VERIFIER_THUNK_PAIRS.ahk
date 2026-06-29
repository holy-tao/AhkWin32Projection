#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DRIVER_VERIFIER_THUNK_PAIRS {
    #StructPack 8

    PristineRoutine : IntPtr

    NewRoutine : IntPtr

}
