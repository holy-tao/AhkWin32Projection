#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the type of offline activation for a license.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-sl_activation_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SL_ACTIVATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Retail phone activation.
     * @type {Integer (Int32)}
     */
    static SL_ACTIVATION_TYPE_DEFAULT => 0

    /**
     * The product activation is through Active Directory.
     * @type {Integer (Int32)}
     */
    static SL_ACTIVATION_TYPE_ACTIVE_DIRECTORY => 1
}
