#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\NET_VALIDATE_PERSISTED_FIELDS.ahk
#Include .\NET_VALIDATE_PASSWORD_HASH.ahk

/**
 * A client application passes the NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG structure to the NetValidatePasswordPolicy function when the application requests a password change validation.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure that contains persistent password-related information about the account being logged on.
     * @type {NET_VALIDATE_PERSISTED_FIELDS}
     */
    InputPersistedFields{
        get {
            if(!this.HasProp("__InputPersistedFields"))
                this.__InputPersistedFields := NET_VALIDATE_PERSISTED_FIELDS(this.ptr + 0)
            return this.__InputPersistedFields
        }
    }

    /**
     * Pointer to a Unicode string specifying the new password, in plaintext format.
     * @type {Pointer<Char>}
     */
    ClearPassword {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a Unicode string specifying the name of the user account.
     * @type {Pointer<Char>}
     */
    UserAccountName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_hash">NET_VALIDATE_PASSWORD_HASH</a> structure that contains a hash of the new password.
     * @type {NET_VALIDATE_PASSWORD_HASH}
     */
    HashedPassword{
        get {
            if(!this.HasProp("__HashedPassword"))
                this.__HashedPassword := NET_VALIDATE_PASSWORD_HASH(this.ptr + 64)
            return this.__HashedPassword
        }
    }

    /**
     * BOOLEAN value that indicates the result of the application's attempt to validate the old password supplied by the user. If this parameter is <b>FALSE</b>, the password was not validated.
     * @type {Integer}
     */
    PasswordMatch {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }
}
