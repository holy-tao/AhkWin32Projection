#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DhcpAddressDelHook function is called by Microsoft DHCP Server when one of the following four defined events occurs.
 * @remarks
 * The following table defines the four defined events that trigger Microsoft DHCP Server to call the 
 * <b>DhcpAddressDelHook</b> function in a third-party DLL.
 * 
 * <table>
 * <tr>
 * <th>Control code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_CONFLICT</td>
 * <td>The address attempted to be offered, as provided in <i>AltAddress</i>, is already in use on the network.</td>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_DECLINE</td>
 * <td>The packet was a DECLINE message for the address specified in <i>AltAddress</i>.</td>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_RELEASE</td>
 * <td>The packet was a RELEASE message for the address specified in <i>AltAddress</i>.</td>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_NACKED</td>
 * <td>The packet was a REQUEST message for the address specified in <i>AltAddress</i>, and the request was declined by Microsoft DHCP Server.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/dhcpssdk/nc-dhcpssdk-lpdhcp_prob
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class LPDHCP_PROB extends IUnknown {

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
     * @param {Pointer<Integer>} Packet 
     * @param {Integer} PacketSize 
     * @param {Integer} ControlCode 
     * @param {Integer} IpAddress 
     * @param {Integer} AltAddress 
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
    Invoke(Packet, PacketSize, ControlCode, IpAddress, AltAddress, Reserved, PktContext) {
        PacketMarshal := Packet is VarRef ? "char*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, PacketMarshal, Packet, "uint", PacketSize, "uint", ControlCode, "uint", IpAddress, "uint", AltAddress, ReservedMarshal, Reserved, PktContextMarshal, PktContext, "uint")
        return result
    }
}
