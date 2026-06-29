#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64 {
    #StructPack 8

    ThreadContext : Int64[4]

    EntryPoint : Int64

    StackPointer : Int64

    ExceptionEntryPoint : Int64

    ExceptionStack : Int64

    ExceptionActive : UInt32

}
