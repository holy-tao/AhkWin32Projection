#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NET_VALIDATE_PASSWORD_HASH structure contains a password hash.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_RESET_INPUT_ARG</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_password_change_input_arg">NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG</a> structures contain a <b>NET_VALIDATE_PASSWORD_HASH</b> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure contains a pointer to this structure.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_password_hash
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NET_VALIDATE_PASSWORD_HASH {
    #StructPack 8

    /**
     * Specifies the length of this structure.
     */
    Length : UInt32

    /**
     * Password hash.
     */
    Hash : IntPtr

}
