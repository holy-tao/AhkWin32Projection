#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_EMULATOR_CALLBACKS {
    #StructPack 8

    Size : UInt32

    Reserved : UInt32

    WHvEmulatorIoPortCallback : IntPtr

    WHvEmulatorMemoryCallback : IntPtr

    WHvEmulatorGetVirtualProcessorRegisters : IntPtr

    WHvEmulatorSetVirtualProcessorRegisters : IntPtr

    WHvEmulatorTranslateGvaPage : IntPtr

}
