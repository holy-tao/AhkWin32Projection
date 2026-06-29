#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_CPUID_RESULT2_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64CpuidResult2FlagSubleafSpecific => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64CpuidResult2FlagVpSpecific => 2
}
