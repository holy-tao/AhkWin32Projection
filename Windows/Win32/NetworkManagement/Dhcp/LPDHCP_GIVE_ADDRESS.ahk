#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DhcpAddressOfferHook function is called by Microsoft DHCP Server directly before Microsoft DHCP Server sends an acknowledgment (ACK) to a DHCP REQUEST message.
 * @remarks
 * Implementations of the 
 * <b>DhcpAddressOfferHook</b> should not block.
 * @see https://learn.microsoft.com/windows/win32/api//content/dhcpssdk/nc-dhcpssdk-lpdhcp_give_address
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class LPDHCP_GIVE_ADDRESS extends IUnknown {

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
     * @param {Integer} AddrType 
     * @param {Integer} LeaseTime 
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
    Invoke(Packet, PacketSize, ControlCode, IpAddress, AltAddress, AddrType, LeaseTime, Reserved, PktContext) {
        PacketMarshal := Packet is VarRef ? "char*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, PacketMarshal, Packet, "uint", PacketSize, "uint", ControlCode, "uint", IpAddress, "uint", AltAddress, "uint", AddrType, "uint", LeaseTime, ReservedMarshal, Reserved, PktContextMarshal, PktContext, "uint")
        return result
    }
}
