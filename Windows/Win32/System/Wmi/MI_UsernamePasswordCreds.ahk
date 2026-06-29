#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A username/password combination used for subscription operations.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_usernamepasswordcreds
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_UsernamePasswordCreds {
    #StructPack 8

    /**
     * The Domain <b>username</b> resides in.
     */
    domain : IntPtr

    /**
     * The <b>username</b> in <b>domain</b>.
     */
    username : IntPtr

    /**
     * The password for <b>username</b>.
     */
    password : IntPtr

}
