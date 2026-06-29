#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_REPLACE_DRIVER_INTERFACE {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    Flags : UInt32

    Unload : IntPtr

    BeginReplace : IntPtr

    EndReplace : IntPtr

    MirrorPhysicalMemory : IntPtr

    SetProcessorId : IntPtr

    Swap : IntPtr

    InitiateHardwareMirror : IntPtr

    MirrorPlatformMemory : IntPtr

    GetMemoryDestination : IntPtr

    EnableDisableHardwareQuiesce : IntPtr

}
