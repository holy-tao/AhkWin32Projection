#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32 {
    #StructPack 4

    ThreadContext : UInt32[4]

    EntryPoint : UInt32

    StackPointer : UInt32

    ExceptionEntryPoint : UInt32

    ExceptionStack : UInt32

    ExceptionActive : UInt32

}
