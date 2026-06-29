#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_NAME {
    #StructPack 8

    ThreadId : UInt32

    RvaOfThreadName : Int64

}
