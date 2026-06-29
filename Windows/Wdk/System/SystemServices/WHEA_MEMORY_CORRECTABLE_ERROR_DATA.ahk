#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_MEMORY_CORRECTABLE_ERROR_DATA {
    #StructPack 8

    ValidBits : IntPtr

    SocketId : UInt32

    ChannelId : UInt32

    DimmSlot : UInt32

    CorrectableErrorCount : UInt32

}
