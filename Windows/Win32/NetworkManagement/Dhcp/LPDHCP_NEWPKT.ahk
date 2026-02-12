#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DhcpNewPktHook function is called by Microsoft DHCP Server shortly after it receives a DHCP packet slated for processing.
 * @remarks
 * If useful, third-party DLLs can modify the <i>Packet</i> buffer, or return a new packet buffer through appropriate modification of the <i>Packet</i> and <i>PacketSize</i> parameters.
 * 
 * If a third-party DLL needs to keep track of a given packet and its progress through Microsoft DHCP Server, it can provide a packet context in <i>PktContext</i>, and use internal structures that track the packet's progress through its DHCP processing. A context provided in <i>PktContext</i> will be passed as a parameter to many other DHCP Server API functions, enabling identification.
 * @see https://learn.microsoft.com/windows/win32/api//content/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class LPDHCP_NEWPKT extends IUnknown {

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
     * @param {Integer} IpAddress 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Pointer<Void>>} PktContext 
     * @param {Pointer<BOOL>} ProcessIt 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Packet, PacketSize, IpAddress, Reserved, PktContext, ProcessIt) {
        PacketMarshal := Packet is VarRef ? "ptr*" : "ptr"
        PacketSizeMarshal := PacketSize is VarRef ? "uint*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr*" : "ptr"
        ProcessItMarshal := ProcessIt is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, PacketMarshal, Packet, PacketSizeMarshal, PacketSize, "uint", IpAddress, ReservedMarshal, Reserved, PktContextMarshal, PktContext, ProcessItMarshal, ProcessIt, "uint")
        return result
    }
}
