#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_PASSTHROUGH_RESPONSE {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    Pad : UInt32

    DataLength : UInt32

    ValidationData : IntPtr

}
