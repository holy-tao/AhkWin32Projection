#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_THROTTLE_MEMORY_ADD_OR_REMOVE_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    SocketId : UInt32

    ChannelId : UInt32

    DimmSlot : UInt32

}
