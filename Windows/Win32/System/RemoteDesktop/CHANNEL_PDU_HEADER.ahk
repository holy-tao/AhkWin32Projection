#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a data block being received by the server end of a virtual channel.
 * @remarks
 * In certain cases, Remote Desktop Services places a 
 *     <b>CHANNEL_PDU_HEADER</b> structure at the beginning 
 *     of each chunk of data read by a call to the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelread">WTSVirtualChannelRead</a> function. This will 
 *     occur if the client DLL sets the <b>CHANNEL_OPTION_SHOW_PROTOCOL</b> option when it calls the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelinit">VirtualChannelInit</a> function to initialize the 
 *     virtual channel. This will also occur if the channel is a dynamic virtual channel written to by using the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-write">IWTSVirtualChannel::Write</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/pchannel/ns-pchannel-channel_pdu_header
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct CHANNEL_PDU_HEADER {
    #StructPack 4

    /**
     * Size, in bytes, of the data block, excluding this header.
     */
    length : UInt32

    /**
     * Information about the data block. The following bit flags will be set. Note that you should not make direct 
     *       comparisons using the '==' operator when comparing the values in the following list; instead, use the comparison 
     *       methods described in the list.
     */
    flags : UInt32

}
