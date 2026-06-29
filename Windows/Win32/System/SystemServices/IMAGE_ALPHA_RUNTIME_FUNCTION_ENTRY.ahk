#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY {
    #StructPack 4

    BeginAddress : UInt32

    EndAddress : UInt32

    ExceptionHandler : UInt32

    HandlerData : UInt32

    PrologEndAddress : UInt32

}
