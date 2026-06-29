#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The different possible values for MS_ATTRIBUTE_IDENTITY_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-identity_type
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IDENTITY_TYPE {
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
    static IDENTITIES_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITIES_ME_ONLY => 1
}
