#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct GUEST_OS_MICROSOFT_IDS {
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
    static GuestOsMicrosoftUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsMicrosoftMSDOS => 1

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsMicrosoftWindows3x => 2

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsMicrosoftWindows9x => 3

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsMicrosoftWindowsNT => 4

    /**
     * @type {Integer (Int32)}
     */
    static GuestOsMicrosoftWindowsCE => 5
}
