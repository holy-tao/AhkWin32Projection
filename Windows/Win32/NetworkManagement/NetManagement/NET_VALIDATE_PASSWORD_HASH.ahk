#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NET_VALIDATE_PASSWORD_HASH structure contains a password hash.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a> structures contain a <b>NET_VALIDATE_PASSWORD_HASH</b> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure contains a pointer to this structure.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_hash
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_VALIDATE_PASSWORD_HASH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the length of this structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Password hash.
     * @type {Pointer<Integer>}
     */
    Hash {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
