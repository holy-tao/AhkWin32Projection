#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_THREAD_BASIC_INFORMATION {
    #StructPack 8

    Valid : UInt32

    ExitStatus : UInt32

    PriorityClass : UInt32

    Priority : UInt32

    CreateTime : Int64

    ExitTime : Int64

    KernelTime : Int64

    UserTime : Int64

    StartOffset : Int64

    Affinity : Int64

}
