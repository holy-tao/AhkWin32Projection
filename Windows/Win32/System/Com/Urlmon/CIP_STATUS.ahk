#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct CIP_STATUS {
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
    static CIP_DISK_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static CIP_ACCESS_DENIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NEWER_VERSION_EXISTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static CIP_OLDER_VERSION_EXISTS => 3

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NAME_CONFLICT => 4

    /**
     * @type {Integer (Int32)}
     */
    static CIP_TRUST_VERIFICATION_COMPONENT_MISSING => 5

    /**
     * @type {Integer (Int32)}
     */
    static CIP_EXE_SELF_REGISTERATION_TIMEOUT => 6

    /**
     * @type {Integer (Int32)}
     */
    static CIP_UNSAFE_TO_ABORT => 7

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NEED_REBOOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static CIP_NEED_REBOOT_UI_PERMISSION => 9
}
