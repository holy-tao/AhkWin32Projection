#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MSV1_0_GETCHALLENRESP_REQUEST {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    ParameterControl : UInt32

    LogonId : IntPtr

    Password : IntPtr

    ChallengeToClient : Int8[8]

    UserName : IntPtr

    LogonDomainName : IntPtr

    ServerName : IntPtr

}
