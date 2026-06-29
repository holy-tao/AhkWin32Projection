#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the type of information in the SYSTEM\_CPU\_SET\_INFORMATION structure.
 * @see https://learn.microsoft.com/windows/win32/ProcThread/cpu-set-information-type
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct CPU_SET_INFORMATION_TYPE {
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
    static CpuSetInformation => 0
}
