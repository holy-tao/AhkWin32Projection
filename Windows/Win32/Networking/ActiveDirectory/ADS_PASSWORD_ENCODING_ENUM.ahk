#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of password encoding used with the ADS_OPTION_PASSWORD_METHOD option in the IADsObjectOptions::GetOption and IADsObjectOptions::SetOption methods.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_password_encoding_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_PASSWORD_ENCODING_ENUM extends Win32Enum{

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
