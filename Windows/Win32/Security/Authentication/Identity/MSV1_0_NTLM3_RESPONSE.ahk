#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_NTLM3_RESPONSE {
    #StructPack 8

    Response : Int8[16]

    RespType : Int8

    HiRespType : Int8

    Flags : UInt16

    MsgWord : UInt32

    TimeStamp : Int64

    ChallengeFromClient : Int8[8]

    AvPairsOff : UInt32

    Buffer : Int8[1]

}
