#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_CPUID_RESULT {
    #StructPack 4

    Function : UInt32

    Reserved : UInt32[3]

    Eax : UInt32

    Ebx : UInt32

    Ecx : UInt32

    Edx : UInt32

}
