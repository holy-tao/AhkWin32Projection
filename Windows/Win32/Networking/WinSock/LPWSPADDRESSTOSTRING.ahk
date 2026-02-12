#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPAddressToString function converts all components of a sockaddr structure into a human-readable numeric string representation of the address. This is used mainly for display purposes.
 * @remarks
 * A layered service provider supplies an implementation of this function, but it is also a client of this function if and when it calls 
 * **LPWSPAddressToString** of the next layer in the protocol chain. Some special considerations apply to the <i>lpProtocolInfo</i> parameter as it is propagated down through the layers of the protocol chain.
 * 
 * If the next layer in the protocol chain is another layer, then, when the next layer's 
 * **LPWSPAddressToString** is called, this layer must pass to the next layer a <i>lpProtocolInfo</i> parameter that references the same unmodified 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure with the same unmodified chain information. However, if the next layer is the base protocol (that is, the last element in the chain), this layer performs a substitution when calling the base provider's 
 * **LPWSPAddressToString**. In this case, the base provider's 
 * **WSAPROTOCOL_INFO** structure should be referenced by the <i>lpProtocolInfo</i> parameter. One vital benefit of this policy is that base service providers do not have to be aware of protocol chains.
 * 
 * This same propagation policy applies when propagating a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure through a layered sequence of other functions such as 
 * [LPWSPDuplicateSocket](nc-ws2spi-lpwspduplicatesocket.md), 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a>, 
 * [LPWSPSocket](nc-ws2spi-lpwspsocket.md), or 
 * [LPWSPStringToAddress](nc-ws2spi-lpwspstringtoaddress.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspaddresstostring
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPADDRESSTOSTRING extends IUnknown {

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
     * @param {Pointer} lpsaAddress 
     * @param {Integer} dwAddressLength 
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfo 
     * @param {PWSTR} lpszAddressString 
     * @param {Pointer<Integer>} lpdwAddressStringLength 
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
    Invoke(lpsaAddress, dwAddressLength, lpProtocolInfo, lpszAddressString, lpdwAddressStringLength, lpErrno) {
        lpszAddressString := lpszAddressString is String ? StrPtr(lpszAddressString) : lpszAddressString

        lpdwAddressStringLengthMarshal := lpdwAddressStringLength is VarRef ? "uint*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", lpsaAddress, "uint", dwAddressLength, "ptr", lpProtocolInfo, "ptr", lpszAddressString, lpdwAddressStringLengthMarshal, lpdwAddressStringLength, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
