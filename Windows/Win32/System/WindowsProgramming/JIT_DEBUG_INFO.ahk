#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct JIT_DEBUG_INFO {
    #StructPack 8

    dwSize : UInt32

    dwProcessorArchitecture : UInt32

    dwThreadID : UInt32

    dwReserved0 : UInt32

    lpExceptionAddress : Int64

    lpExceptionRecord : Int64

    lpContextRecord : Int64

}
