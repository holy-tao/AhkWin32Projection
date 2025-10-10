#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to create certificate requests on behalf of a user.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_enrollment_name_value_pair
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_ENROLLMENT_NAME_VALUE_PAIR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Name of a certificate requester.
     * @type {Pointer<Char>}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the user for whom the certificate is being requested.
     * @type {Pointer<Char>}
     */
    pwszValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
