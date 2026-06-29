#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Security\Authentication\Identity\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import "..\..\..\Win32\Security\PSID.ahk" { PSID }
#Import "..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MSV1_0_GETUSERINFO_RESPONSE {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    UserSid : PSID

    UserName : IntPtr

    LogonDomainName : IntPtr

    LogonServer : IntPtr

    LogonType : SECURITY_LOGON_TYPE

}
