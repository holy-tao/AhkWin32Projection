#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the type of password encoding used with the ADS_OPTION_PASSWORD_METHOD option in the IADsObjectOptions::GetOption and IADsObjectOptions::SetOption methods.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_password_encoding_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_PASSWORD_ENCODING_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Passwords are encoded using SSL.
     * @type {Integer (Int32)}
     */
    static ADS_PASSWORD_ENCODE_REQUIRE_SSL => 0

    /**
     * Passwords are not encoded and are transmitted in plaintext.
     * @type {Integer (Int32)}
     */
    static ADS_PASSWORD_ENCODE_CLEAR => 1
}
