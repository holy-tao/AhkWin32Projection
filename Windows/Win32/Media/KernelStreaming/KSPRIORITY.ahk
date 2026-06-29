#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPRIORITY {
    #StructPack 4

    PriorityClass : UInt32

    PrioritySubClass : UInt32

}
