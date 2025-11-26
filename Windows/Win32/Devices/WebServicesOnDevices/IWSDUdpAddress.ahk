#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk
#Include .\IWSDTransportAddress.ahk

/**
 * Provides access to the individual components of a UDP address.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdudpaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDUdpAddress extends IWSDTransportAddress{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDUdpAddress
     * @type {Guid}
     */
    static IID => Guid("{74d6124a-a441-4f78-a1eb-97a8d1996893}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSockaddr", "GetSockaddr", "SetExclusive", "GetExclusive", "SetMessageType", "GetMessageType", "SetTTL", "GetTTL", "SetAlias", "GetAlias"]

    /**
     * Sets the socket address information.
     * @param {Pointer<SOCKADDR_STORAGE>} pSockAddr Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pSockAddr</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(WSAEINVAL)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address is not a valid socket address, or no transport provider supports the indicated address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(WSANOTINITIALISED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Winsock 2 DLL has not been initialized. The application must first call <a href="/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> to initialize Winsock 2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(WSAENOBUFS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No buffer space available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-setsockaddr
     */
    SetSockaddr(pSockAddr) {
        result := ComCall(10, this, "ptr", pSockAddr, "HRESULT")
        return result
    }

    /**
     * Gets the socket address information.
     * @returns {SOCKADDR_STORAGE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the address information.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-getsockaddr
     */
    GetSockaddr() {
        pSockAddr := SOCKADDR_STORAGE()
        result := ComCall(11, this, "ptr", pSockAddr, "HRESULT")
        return pSockAddr
    }

    /**
     * Controls whether the socket is in exclusive mode.
     * @param {BOOL} fExclusive A value of <b>TRUE</b> indicates that the socket should be set to exclusive mode. A value of <b>FALSE</b> indicates that the socket should not be in exclusive mode.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-setexclusive
     */
    SetExclusive(fExclusive) {
        result := ComCall(12, this, "int", fExclusive, "HRESULT")
        return result
    }

    /**
     * Determines whether the socket is in exclusive mode.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket is in exclusive mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket is not in exclusive mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-getexclusive
     */
    GetExclusive() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Sets the message type for this UDP address configuration.
     * @param {Integer} messageType A <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ne-wsdbase-wsdudpmessagetype">WSDUdpMessageType</a> value that specifies the message type used for this address configuration.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-setmessagetype
     */
    SetMessageType(messageType) {
        result := ComCall(14, this, "int", messageType, "HRESULT")
        return result
    }

    /**
     * Gets the message type for this UDP address configuration.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ne-wsdbase-wsdudpmessagetype">WSDUdpMessageType</a> value that specifies the message type used for this address configuration.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-getmessagetype
     */
    GetMessageType() {
        result := ComCall(15, this, "int*", &pMessageType := 0, "HRESULT")
        return pMessageType
    }

    /**
     * Sets the time-to-live (TTL) for all outbound packets using this address.
     * @param {Integer} dwTTL The TTL of outgoing UDP packets. Generally, the TTL represents the maximum number of hops before a packet is discarded. Some implementations interpret the TTL differently.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwTTL</i> is greater than 255.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-setttl
     */
    SetTTL(dwTTL) {
        result := ComCall(16, this, "uint", dwTTL, "HRESULT")
        return result
    }

    /**
     * Gets the time-to-live (TTL) for all outbound packets using this address.
     * @returns {Integer} Pointer to the TTL of outgoing UDP packets. Generally, the TTL represents the maximum number of hops before a packet is discarded. Some implementations interpret the TTL differently.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-getttl
     */
    GetTTL() {
        result := ComCall(17, this, "uint*", &pdwTTL := 0, "HRESULT")
        return pdwTTL
    }

    /**
     * Sets the alias for the discovery address.
     * @param {Pointer<Guid>} pAlias A pointer to the alias of the discovery address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-setalias
     */
    SetAlias(pAlias) {
        result := ComCall(18, this, "ptr", pAlias, "HRESULT")
        return result
    }

    /**
     * Gets the alias for the discovery address.
     * @returns {Guid} Pointer to the alias of the discovery address.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpaddress-getalias
     */
    GetAlias() {
        pAlias := Guid()
        result := ComCall(19, this, "ptr", pAlias, "HRESULT")
        return pAlias
    }
}
