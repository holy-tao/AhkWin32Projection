#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the licensing status. (SLLICENSINGSTATUS)
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-sllicensingstatus
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SLLICENSINGSTATUS {
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
    static SL_LICENSING_STATUS_UNLICENSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_LICENSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_IN_GRACE_PERIOD => 2

    /**
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_NOTIFICATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_LAST => 4
}
