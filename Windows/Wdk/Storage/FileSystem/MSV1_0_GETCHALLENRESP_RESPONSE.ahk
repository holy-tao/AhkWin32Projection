#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct MSV1_0_GETCHALLENRESP_RESPONSE {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    CaseSensitiveChallengeResponse : IntPtr

    CaseInsensitiveChallengeResponse : IntPtr

    UserName : IntPtr

    LogonDomainName : IntPtr

    UserSessionKey : Int8[16]

    LanmanSessionKey : Int8[8]

}
