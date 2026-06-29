#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TRANSLATEURL_IN_FLAGS enumerated values are used with the TranslateURL function to determine how it will execute.
 * @see https://learn.microsoft.com/windows/win32/api/intshcut/ne-intshcut-translateurl_in_flags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct TRANSLATEURL_IN_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If the protocol scheme is not specified in the <i>pcszURL</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/intshcut/nf-intshcut-translateurla">TranslateURL</a>, the system automatically chooses a scheme and adds it to the URL.
     * @type {Integer (Int32)}
     */
    static TRANSLATEURL_FL_GUESS_PROTOCOL => 1

    /**
     * If the protocol scheme is not specified in the <i>pcszURL</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/intshcut/nf-intshcut-translateurla">TranslateURL</a>, the system adds the default protocol to the URL.
     * @type {Integer (Int32)}
     */
    static TRANSLATEURL_FL_USE_DEFAULT_PROTOCOL => 2
}
