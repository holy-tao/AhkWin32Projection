#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * LPDHCP_DROP_SEND callback function
 * @remarks
 * The 
 * <b>DhcpPktDropHook</b> function is called by Microsoft DHCP Server when a DHCP packet is dropped, or a packet is completely processed. The 
 * <b>DhcpPktDropHook</b> is implemented by a third-party DLL that registers for notification of significant Microsoft DHCP Server events.
 * 
 * The 
 * <b>DhcpPktDropHook</b> function should not block.
 * 
 * Third-party DLLs that register for notification of this event should be prepared to have their 
 * <b>DhcpPktDropHook</b> function called multiple times for each packet. If a packet is dropped by Microsoft DHCP Server, this function is called twice for that packet: once to notify that the packet was dropped, and again to identify that the packet was completely processed.
 * 
 * The following table defines the possible control codes returned in the <i>ControlCode</i> parameter.
 * 
 * <table>
 * <tr>
 * <th>Control code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_DUPLICATE</td>
 * <td>The packet is a duplicate of another received by the DHCP server.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_NOMEM</td>
 * <td>There is not enough memory available to process the packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_INTERNAL_ERROR</td>
 * <td>An unexpected internal error has occurred.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_TIMEOUT</td>
 * <td>The packet is too old to process.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_UNAUTH</td>
 * <td>The server is not authorized to process this packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_PAUSED</td>
 * <td>The server is paused.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_NO_SUBNETS</td>
 * <td>There are no subnets configured, therefore there is no point in processing the packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_INVALID</td>
 * <td>The packet is invalid, or it was received on an invalid socket.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_WRONG_SERVER</td>
 * <td>The packet was sent to the wrong DHCP Server.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_NOADDRESS</td>
 * <td>There is no address to offer.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_PROCESSED</td>
 * <td>The packet has been processed.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_GEN_FAILURE</td>
 * <td>An unknown error has occurred.</td>
 * </tr>
 * </table>
 *  
 * 
 * The 
 * <b>DhcpPktSendHook</b> function is called by Microsoft DHCP Server directly before Microsoft DHCP Server sends a response to a client. Registering for notification of 
 * <b>DhcpPktSendHook</b> enables third-party developers to alter the response of the Microsoft DHCP Server by manipulation of the packet pointers. The 
 * <b>DhcpPktSendHook</b> is implemented by a third-party DLL that registers for notification of significant Microsoft DHCP Server events.
 * 
 * The 
 * <b>DhcpPktSendHook</b> function should not block.
 * 
 * The 
 * <b>DhcpPktSendHook</b> function should not block.
 * @see https://learn.microsoft.com/windows/win32/api//content/dhcpssdk/nc-dhcpssdk-lpdhcp_drop_send
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class LPDHCP_DROP_SEND extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Pointer<Integer>>} Packet 
     * @param {Pointer<Integer>} PacketSize 
     * @param {Integer} ControlCode 
     * @param {Integer} IpAddress 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Void>} PktContext 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Packet, PacketSize, ControlCode, IpAddress, Reserved, PktContext) {
        PacketMarshal := Packet is VarRef ? "ptr*" : "ptr"
        PacketSizeMarshal := PacketSize is VarRef ? "uint*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, PacketMarshal, Packet, PacketSizeMarshal, PacketSize, "uint", ControlCode, "uint", IpAddress, ReservedMarshal, Reserved, PktContextMarshal, PktContext, "uint")
        return result
    }
}
