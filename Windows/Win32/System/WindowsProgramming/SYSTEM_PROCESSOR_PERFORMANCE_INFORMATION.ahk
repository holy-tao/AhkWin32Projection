#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION {
    #StructPack 8

    IdleTime : Int64

    KernelTime : Int64

    UserTime : Int64

    Reserved1 : Int64[2]

    Reserved2 : UInt32

}
