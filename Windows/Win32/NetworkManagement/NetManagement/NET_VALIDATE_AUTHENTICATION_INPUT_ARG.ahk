#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NET_VALIDATE_PASSWORD_HASH.ahk" { NET_VALIDATE_PASSWORD_HASH }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\NET_VALIDATE_PERSISTED_FIELDS.ahk" { NET_VALIDATE_PERSISTED_FIELDS }

/**
 * A client application passes the NET_VALIDATE_AUTHENTICATION_INPUT_ARG structure to the NetValidatePasswordPolicy function when the application requests an authentication validation.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_validate_authentication_input_arg
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NET_VALIDATE_AUTHENTICATION_INPUT_ARG {
    #StructPack 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ns-lmaccess-net_validate_persisted_fields">NET_VALIDATE_PERSISTED_FIELDS</a> structure that contains persistent password-related information about the account being logged on.
     */
    InputPersistedFields : NET_VALIDATE_PERSISTED_FIELDS

    /**
     * BOOLEAN value that indicates the result of the client application's authentication of the password supplied by the user. If this parameter is <b>FALSE</b>, the password has not been authenticated.
     */
    PasswordMatched : BOOLEAN

}
