#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_LOOKUP_DOMAIN_INFO_CLASS {
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
    static AccountDomainInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static DnsDomainInformation => 12
}
