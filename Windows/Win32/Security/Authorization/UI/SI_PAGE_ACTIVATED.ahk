#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct SI_PAGE_ACTIVATED {
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
    static SI_SHOW_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SI_SHOW_PERM_ACTIVATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SI_SHOW_AUDIT_ACTIVATED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SI_SHOW_OWNER_ACTIVATED => 3

    /**
     * @type {Integer (Int32)}
     */
    static SI_SHOW_EFFECTIVE_ACTIVATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static SI_SHOW_SHARE_ACTIVATED => 5

    /**
     * @type {Integer (Int32)}
     */
    static SI_SHOW_CENTRAL_POLICY_ACTIVATED => 6
}
