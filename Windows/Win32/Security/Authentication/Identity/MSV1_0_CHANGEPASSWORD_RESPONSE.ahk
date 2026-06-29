#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOMAIN_PASSWORD_INFORMATION.ahk" { DOMAIN_PASSWORD_INFORMATION }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOMAIN_PASSWORD_PROPERTIES.ahk" { DOMAIN_PASSWORD_PROPERTIES }
#Import ".\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_CHANGEPASSWORD_RESPONSE {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    PasswordInfoValid : BOOLEAN

    DomainPasswordInfo : DOMAIN_PASSWORD_INFORMATION

}
