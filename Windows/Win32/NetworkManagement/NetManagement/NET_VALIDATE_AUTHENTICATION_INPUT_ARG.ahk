#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\NET_VALIDATE_PERSISTED_FIELDS.ahk

/**
 * A client application passes the NET_VALIDATE_AUTHENTICATION_INPUT_ARG structure to the NetValidatePasswordPolicy function when the application requests an authentication validation.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-net_validate_authentication_input_arg
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_VALIDATE_AUTHENTICATION_INPUT_ARG extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure that contains persistent password-related information about the account being logged on.
     * @type {NET_VALIDATE_PERSISTED_FIELDS}
     */
    InputPersistedFields{
        get {
            if(!this.HasProp("__InputPersistedFields"))
                this.__InputPersistedFields := NET_VALIDATE_PERSISTED_FIELDS(0, this)
            return this.__InputPersistedFields
        }
    }

    /**
     * BOOLEAN value that indicates the result of the client application's authentication of the password supplied by the user. If this parameter is <b>FALSE</b>, the password has not been authenticated.
     * @type {BOOLEAN}
     */
    PasswordMatched {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }
}
