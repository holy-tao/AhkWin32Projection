#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_CPUID_OUTPUT.ahk" { WHV_CPUID_OUTPUT }
#Import ".\WHV_X64_CPUID_RESULT2_FLAGS.ahk" { WHV_X64_CPUID_RESULT2_FLAGS }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_CPUID_RESULT2 {
    #StructPack 4

    Function : UInt32

    Index : UInt32

    VpIndex : UInt32

    Flags : WHV_X64_CPUID_RESULT2_FLAGS

    Output : WHV_CPUID_OUTPUT

    Mask : WHV_CPUID_OUTPUT

}
