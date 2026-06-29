#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_HANDLECOUNT_INFORMATION {
    #StructPack 4

    ProcessCount : UInt32

    ThreadCount : UInt32

    HandleCount : UInt32

}
