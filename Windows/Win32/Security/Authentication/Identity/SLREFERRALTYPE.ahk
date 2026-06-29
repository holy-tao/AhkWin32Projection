#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the types of information that can be queried with the SLGetReferralInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-slreferraltype
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SLREFERRALTYPE {
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
    static SL_REFERRALTYPE_SKUID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SL_REFERRALTYPE_APPID => 1

    /**
     * @type {Integer (Int32)}
     */
    static SL_REFERRALTYPE_OVERRIDE_SKUID => 2

    /**
     * @type {Integer (Int32)}
     */
    static SL_REFERRALTYPE_OVERRIDE_APPID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SL_REFERRALTYPE_BEST_MATCH => 4
}
