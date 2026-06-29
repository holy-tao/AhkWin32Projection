#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_CPUID_OUTPUT {
    #StructPack 4

    Eax : UInt32

    Ebx : UInt32

    Ecx : UInt32

    Edx : UInt32

}
