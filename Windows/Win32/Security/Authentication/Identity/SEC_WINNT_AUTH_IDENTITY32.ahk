#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_WINNT_AUTH_IDENTITY32 {
    #StructPack 4

    User : UInt32

    UserLength : UInt32

    Domain : UInt32

    DomainLength : UInt32

    Password : UInt32

    PasswordLength : UInt32

    Flags : UInt32

}
