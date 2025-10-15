#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 0)
            return this.__pwszName
        }
    }

    /**
     * Name of the user for whom the certificate is being requested.
     * @type {PWSTR}
     */
    pwszValue{
        get {
            if(!this.HasProp("__pwszValue"))
                this.__pwszValue := PWSTR(this.ptr + 8)
            return this.__pwszValue
        }
    }
}
