#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\NET_VALIDATE_PERSISTED_FIELDS.ahk

/**
 * The NET_VALIDATE_OUTPUT_ARG structure contains information about persistent password-related data that has changed since the user's last logon as well as the result of the function's password validation check.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicy">NetValidatePasswordPolicy</a> function outputs the <b>NET_VALIDATE_OUTPUT_ARG</b> structure. 
  * 
  * Note that it is the application's responsibility to save all the data in the <b>ChangedPersistedFields</b> member of the <b>NET_VALIDATE_OUTPUT_ARG</b> structure as well as any User object information. The next time the application calls <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicy">NetValidatePasswordPolicy</a> on the same instance of the User object, the application must provide the required fields from the persistent information.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_output_arg
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_VALIDATE_OUTPUT_ARG extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A  structure that contains changes to persistent information about the account being logged on. For more information, see the following Remarks section.
     * @type {NET_VALIDATE_PERSISTED_FIELDS}
     */
    ChangedPersistedFields{
        get {
            if(!this.HasProp("__ChangedPersistedFields"))
                this.__ChangedPersistedFields := NET_VALIDATE_PERSISTED_FIELDS(this.ptr + 0)
            return this.__ChangedPersistedFields
        }
    }

    /**
     * The result of the password validation check performed by the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netvalidatepasswordpolicy">NetValidatePasswordPolicy</a> function. The status depends on the value specified in the <i>ValidationType</i> parameter to that function.
     * @type {Integer}
     */
    ValidationStatus {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
