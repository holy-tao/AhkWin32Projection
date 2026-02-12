#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The WSPStringToAddress function converts a human-readable numeric string to a socket address structure (sockaddr) suitable to passing to Windows Sockets routines that take such a structure.
 * @remarks
 * A layered service provider supplies an implementation of this function, but it is also a client of this function if and when it calls 
 * **WSPStringToAddress** of the next layer in the protocol chain. Some special considerations apply to this function's <i>lpProtocolInfo</i> parameter as it is propagated down through the layers of the protocol chain.
 * 
 * If the next layer in the protocol chain is another layer, then when the next layer's 
 * **WSPStringToAddress** is called, this layer must pass to the next layer a <i>lpProtocolInfo</i> that references the same unmodified 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure with the same unmodified chain information. However, if the next layer is the base protocol (that is, the last element in the chain), this layer performs a substitution when calling the base provider's 
 * **WSPStringToAddress**. In this case, the base provider's 
 * **WSAPROTOCOL_INFO** structure should be referenced by the <i>lpProtocolInfo</i> parameter.
 * 
 * One vital benefit of this policy is that base service providers do not have to be aware of protocol chains.
 * 
 * This same propagation policy applies when propagating a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure through a layered sequence of other functions such as 
 * [LPWSPAddressToString](nc-ws2spi-lpwspaddresstostring.md), 
 * [LPWSPDuplicateSocket](nc-ws2spi-lpwspduplicatesocket.md), 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a>, or 
 * [LPWSPSocket](nc-ws2spi-lpwspsocket.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspstringtoaddress
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPSTRINGTOADDRESS extends IUnknown {

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
     * @param {PWSTR} AddressString 
     * @param {Integer} AddressFamily 
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfo 
     * @param {Pointer} lpAddress 
     * @param {Pointer<Integer>} lpAddressLength 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(AddressString, AddressFamily, lpProtocolInfo, lpAddress, lpAddressLength, lpErrno) {
        AddressString := AddressString is String ? StrPtr(AddressString) : AddressString

        lpAddressLengthMarshal := lpAddressLength is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", AddressString, "int", AddressFamily, "ptr", lpProtocolInfo, "ptr", lpAddress, lpAddressLengthMarshal, lpAddressLength, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
