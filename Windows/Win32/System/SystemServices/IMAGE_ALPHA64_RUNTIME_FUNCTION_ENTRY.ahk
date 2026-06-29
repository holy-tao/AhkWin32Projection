#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY {
    #StructPack 8

    BeginAddress : Int64

    EndAddress : Int64

    ExceptionHandler : Int64

    HandlerData : Int64

    PrologEndAddress : Int64

}
