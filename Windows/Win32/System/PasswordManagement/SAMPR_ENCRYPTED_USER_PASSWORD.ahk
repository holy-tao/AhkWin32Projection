#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SAMPR_ENCRYPTED_USER_PASSWORD stores a user's encrypted password.
 * @see https://docs.microsoft.com/windows/win32/api//mschapp/ns-mschapp-sampr_encrypted_user_password
 * @namespace Windows.Win32.System.PasswordManagement
 * @version v4.0.30319
 */
class SAMPR_ENCRYPTED_USER_PASSWORD extends Win32Struct
{
    static sizeof => 516

    static packingSize => 1

    /**
     * An array contains an encrypted password. The contents of the array are calculated using either the <b>NewPasswordEncryptedWithOldNtPasswordHash</b> or <b>NewPasswordEncryptedWithOldLmPasswordHash</b> functions as defined in <a href="https://www.ietf.org/rfc/rfc2433.txt">RFC 2433</a>, sections A.11 and A.15 respectively.
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 0, 516, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
