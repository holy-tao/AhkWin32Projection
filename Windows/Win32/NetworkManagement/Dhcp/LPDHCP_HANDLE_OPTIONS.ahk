#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DhcpHandleOptionsHook function enables third-party DLLs to obtain commonly used options from a DHCP packet, avoiding the need to process the entire DHCP packet. The DhcpHandleOptionsHook function should not block.
 * @remarks
 * The 
 * <i>DhcpHandleOptionsHook</i> function is useful when developers of third-party DLLs want to avoid having to process an entire DHCP packet, and rather, could achieve the desired results by a set of commonly used server options. When third-party DLLs register for this event notification, the Microsoft DHCP Server parses the incoming packet, extracts commonly used server options, and passes them to the third-party DLL in the <i>ServerOptions</i> parameter.
 * 
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpssdk/ns-dhcpssdk-dhcp_server_options">DHCP_SERVER_OPTIONS</a> structure pointed to in <i>ServerOptions</i> is needed beyond the completion of the 
 * <i>DhcpHandleOptionsHook</i> function call, third-party DLLs must make a copy of the structure.
 * 
 * The 
 * <i>DhcpHandleOptionsHook</i> function can be called multiple times for a single packet.
 * @see https://learn.microsoft.com/windows/win32/api//content/dhcpssdk/nc-dhcpssdk-lpdhcp_handle_options
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class LPDHCP_HANDLE_OPTIONS extends IUnknown {

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
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Void>} PktContext 
     * @param {Pointer<DHCP_SERVER_OPTIONS>} ServerOptions 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Packet, PacketSize, Reserved, PktContext, ServerOptions) {
        PacketMarshal := Packet is VarRef ? "char*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, PacketMarshal, Packet, "uint", PacketSize, ReservedMarshal, Reserved, PktContextMarshal, PktContext, "ptr", ServerOptions, "uint")
        return result
    }
}
