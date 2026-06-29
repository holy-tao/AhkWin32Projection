#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOCINFO structure is returned by the IsDestinationReachable function and provides Quality of Connection information to the caller.
 * @see https://learn.microsoft.com/windows/win32/api/sensapi/ns-sensapi-qocinfo
 * @namespace Windows.Win32.System.EventNotificationService
 */
export default struct QOCINFO {
    #StructPack 4

    /**
     * Upon calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/nf-sensapi-isdestinationreachablea">IsDestinationReachable</a>, the caller must specify the size of the <b>QOCINFO</b> structure being provided to the function using dwSize. The size should be specified in bytes. Upon return from <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/nf-sensapi-isdestinationreachablea">IsDestinationReachable</a>, dwSize contains the size of the provided structure in bytes.
     */
    dwSize : UInt32

    /**
     * Provides information on the type of network connection available. The following table lists the possible values.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETWORK_ALIVE_LAN"></a><a id="network_alive_lan"></a><dl>
     * <dt><b>NETWORK_ALIVE_LAN</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer has one or more active LAN cards.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETWORK_ALIVE_WAN"></a><a id="network_alive_wan"></a><dl>
     * <dt><b>NETWORK_ALIVE_WAN</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer has one or more active RAS connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETWORK_ALIVE_AOL"></a><a id="network_alive_aol"></a><dl>
     * <dt><b>NETWORK_ALIVE_AOL</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Speed of data coming in from the destination in bytes per second.
     */
    dwInSpeed : UInt32

    /**
     * Speed of data sent to the destination in bytes per second.
     */
    dwOutSpeed : UInt32

}
