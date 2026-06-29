#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains pointers to the functions called by a client-side DLL to access virtual channels.
 * @see https://learn.microsoft.com/windows/win32/api/cchannel/ns-cchannel-channel_entry_points
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct CHANNEL_ENTRY_POINTS {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Protocol version. Remote Desktop Services sets this member to <b>VIRTUAL_CHANNEL_VERSION_WIN2000</b>.
     */
    protocolVersion : UInt32

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelinit">VirtualChannelInit</a> function.
     */
    pVirtualChannelInit : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelopen">VirtualChannelOpen</a> function.
     */
    pVirtualChannelOpen : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelclose">VirtualChannelClose</a> function.
     */
    pVirtualChannelClose : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelwrite">VirtualChannelWrite</a> function.
     */
    pVirtualChannelWrite : IntPtr

}
