#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The NET_VALIDATE_PERSISTED_FIELDS structure contains information about a user's password properties.
 * @remarks
 * 
 * Note that it is the application's responsibility to save all changed persistent data as well as any user object information. The next time the application calls <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicy">NetValidatePasswordPolicy</a> on the same instance of the user object, the application must provide the required fields from the persistent information.
 * 
 * The <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_authentication_input_arg">NET_VALIDATE_AUTHENTICATION_INPUT_ARG</a>, <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a>, <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_reset_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_output_arg">NET_VALIDATE_OUTPUT_ARG</a> structures contain a <b>NET_VALIDATE_PERSISTED_FIELDS</b> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-net_validate_persisted_fields
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_VALIDATE_PERSISTED_FIELDS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * A set of bit flags identifying the persistent password-related data that has changed. This member is valid only when this structure is output from the <b>NetValidatePasswordPolicy</b> function. This member is ignored when this structure is input to the function. For more information, see the following Remarks section.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_VALIDATE_PASSWORD_LAST_SET"></a><a id="net_validate_password_last_set"></a><dl>
     * <dt><b>NET_VALIDATE_PASSWORD_LAST_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>PasswordLastSet</b> member contains a new value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_VALIDATE_BAD_PASSWORD_TIME"></a><a id="net_validate_bad_password_time"></a><dl>
     * <dt><b>NET_VALIDATE_BAD_PASSWORD_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BadPasswordTime</b> member contains a new value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_VALIDATE_LOCKOUT_TIME"></a><a id="net_validate_lockout_time"></a><dl>
     * <dt><b>NET_VALIDATE_LOCKOUT_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>LockoutTime</b> member contains a new value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_VALIDATE_BAD_PASSWORD_COUNT"></a><a id="net_validate_bad_password_count"></a><dl>
     * <dt><b>NET_VALIDATE_BAD_PASSWORD_COUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BadPasswordCount</b> member contains a new value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_VALIDATE_PASSWORD_HISTORY_LENGTH"></a><a id="net_validate_password_history_length"></a><dl>
     * <dt><b>NET_VALIDATE_PASSWORD_HISTORY_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>PasswordHistoryLength</b> member contains a new value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NET_VALIDATE_PASSWORD_HISTORY"></a><a id="net_validate_password_history"></a><dl>
     * <dt><b>NET_VALIDATE_PASSWORD_HISTORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>PasswordHistory</b> member contains a new value.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PresentFields {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * The date and time (in GMT) when the password for the account was set or last changed.
     * @type {FILETIME}
     */
    PasswordLastSet{
        get {
            if(!this.HasProp("__PasswordLastSet"))
                this.__PasswordLastSet := FILETIME(8, this)
            return this.__PasswordLastSet
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * The date and time (in GMT) when the user tried to log on to the account using an incorrect password.
     * @type {FILETIME}
     */
    BadPasswordTime{
        get {
            if(!this.HasProp("__BadPasswordTime"))
                this.__BadPasswordTime := FILETIME(16, this)
            return this.__BadPasswordTime
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * The date and time (in GMT) when the account was last locked out. If the account has not been locked out, this member is zero. A lockout occurs when the number of bad password logins exceeds the number allowed.
     * @type {FILETIME}
     */
    LockoutTime{
        get {
            if(!this.HasProp("__LockoutTime"))
                this.__LockoutTime := FILETIME(24, this)
            return this.__LockoutTime
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of times the user tried to log on to the account using an incorrect password.
     * @type {Integer}
     */
    BadPasswordCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of previous passwords saved in the history list for the account. The user cannot reuse a password in the history list.
     * @type {Integer}
     */
    PasswordHistoryLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>PNET_VALIDATE_PASSWORD_HASH</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_hash">NET_VALIDATE_PASSWORD_HASH</a> structure that contains the password hashes in the history list.
     * @type {Pointer<NET_VALIDATE_PASSWORD_HASH>}
     */
    PasswordHistory {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
