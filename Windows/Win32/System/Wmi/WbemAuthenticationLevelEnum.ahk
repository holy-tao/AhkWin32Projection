#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Define the security authentication levels.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemauthenticationlevelenum
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemAuthenticationLevelEnum {
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
    static wbemAuthenticationLevelDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelConnect => 2

    /**
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelCall => 3

    /**
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelPkt => 4

    /**
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelPktIntegrity => 5

    /**
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelPktPrivacy => 6
}
