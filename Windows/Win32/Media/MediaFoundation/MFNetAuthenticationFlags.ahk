#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the user's credentials will be used.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetauthenticationflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFNetAuthenticationFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The credentials will be used to authenticate with a proxy.
     * @type {Integer (Int32)}
     */
    static MFNET_AUTHENTICATION_PROXY => 1

    /**
     * The credentials will be sent over the network unencrypted.
     * @type {Integer (Int32)}
     */
    static MFNET_AUTHENTICATION_CLEAR_TEXT => 2

    /**
     * The credentials must be from a user who is currently logged on.
     * @type {Integer (Int32)}
     */
    static MFNET_AUTHENTICATION_LOGGED_ON_USER => 4
}
