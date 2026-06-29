#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the secondary flags for the minidump.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_secondary_flags
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_SECONDARY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The minidump information does not retrieve the processor power information contained in the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info_2">MINIDUMP_MISC_INFO_2</a> structure.
     * @type {Integer (Int32)}
     */
    static MiniSecondaryWithoutPowerInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static MiniSecondaryValidFlags => 1
}
