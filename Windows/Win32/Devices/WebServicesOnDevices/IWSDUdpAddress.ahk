#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WSDUdpMessageType.ahk" { WSDUdpMessageType }
#Import ".\IWSDTransportAddress.ahk" { IWSDTransportAddress }
#Import "..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides access to the individual components of a UDP address.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdudpaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDUdpAddress extends IWSDTransportAddress {
    /**
     * The interface identifier for IWSDUdpAddress
     * @type {Guid}
     */
    static IID := Guid("{74d6124a-a441-4f78-a1eb-97a8d1996893}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDUdpAddress interfaces
    */
    struct Vtbl extends IWSDTransportAddress.Vtbl {
        SetSockaddr    : IntPtr
        GetSockaddr    : IntPtr
        SetExclusive   : IntPtr
        GetExclusive   : IntPtr
        SetMessageType : IntPtr
        GetMessageType : IntPtr
        SetTTL         : IntPtr
        GetTTL         : IntPtr
        SetAlias       : IntPtr
        GetAlias       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDUdpAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The Winsock 2 DLL has not been initialized. The application must first call <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsastartup">WSAStartup</a> to initialize Winsock 2.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setsockaddr
     */
    SetSockaddr(pSockAddr) {
        result := ComCall(10, this, SOCKADDR_STORAGE.Ptr, pSockAddr, "HRESULT")
        return result
    }

    /**
     * Gets the socket address information.
     * @returns {SOCKADDR_STORAGE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the address information.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getsockaddr
     */
    GetSockaddr() {
        pSockAddr := SOCKADDR_STORAGE()
        result := ComCall(11, this, SOCKADDR_STORAGE.Ptr, pSockAddr, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setexclusive
     */
    SetExclusive(fExclusive) {
        result := ComCall(12, this, BOOL, fExclusive, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getexclusive
     */
    GetExclusive() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Sets the message type for this UDP address configuration.
     * @param {WSDUdpMessageType} messageType A <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ne-wsdbase-wsdudpmessagetype">WSDUdpMessageType</a> value that specifies the message type used for this address configuration.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setmessagetype
     */
    SetMessageType(messageType) {
        result := ComCall(14, this, WSDUdpMessageType, messageType, "HRESULT")
        return result
    }

    /**
     * Gets the message type for this UDP address configuration.
     * @returns {WSDUdpMessageType} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ne-wsdbase-wsdudpmessagetype">WSDUdpMessageType</a> value that specifies the message type used for this address configuration.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getmessagetype
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setttl
     */
    SetTTL(dwTTL) {
        result := ComCall(16, this, "uint", dwTTL, "HRESULT")
        return result
    }

    /**
     * Gets the time-to-live (TTL) for all outbound packets using this address.
     * @returns {Integer} Pointer to the TTL of outgoing UDP packets. Generally, the TTL represents the maximum number of hops before a packet is discarded. Some implementations interpret the TTL differently.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getttl
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-setalias
     */
    SetAlias(pAlias) {
        result := ComCall(18, this, Guid.Ptr, pAlias, "HRESULT")
        return result
    }

    /**
     * Gets the alias for the discovery address.
     * @returns {Guid} Pointer to the alias of the discovery address.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpaddress-getalias
     */
    GetAlias() {
        pAlias := Guid()
        result := ComCall(19, this, Guid.Ptr, pAlias, "HRESULT")
        return pAlias
    }

    Query(iid) {
        if (IWSDUdpAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSockaddr := CallbackCreate(GetMethod(implObj, "SetSockaddr"), flags, 2)
        this.vtbl.GetSockaddr := CallbackCreate(GetMethod(implObj, "GetSockaddr"), flags, 2)
        this.vtbl.SetExclusive := CallbackCreate(GetMethod(implObj, "SetExclusive"), flags, 2)
        this.vtbl.GetExclusive := CallbackCreate(GetMethod(implObj, "GetExclusive"), flags, 1)
        this.vtbl.SetMessageType := CallbackCreate(GetMethod(implObj, "SetMessageType"), flags, 2)
        this.vtbl.GetMessageType := CallbackCreate(GetMethod(implObj, "GetMessageType"), flags, 2)
        this.vtbl.SetTTL := CallbackCreate(GetMethod(implObj, "SetTTL"), flags, 2)
        this.vtbl.GetTTL := CallbackCreate(GetMethod(implObj, "GetTTL"), flags, 2)
        this.vtbl.SetAlias := CallbackCreate(GetMethod(implObj, "SetAlias"), flags, 2)
        this.vtbl.GetAlias := CallbackCreate(GetMethod(implObj, "GetAlias"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSockaddr)
        CallbackFree(this.vtbl.GetSockaddr)
        CallbackFree(this.vtbl.SetExclusive)
        CallbackFree(this.vtbl.GetExclusive)
        CallbackFree(this.vtbl.SetMessageType)
        CallbackFree(this.vtbl.GetMessageType)
        CallbackFree(this.vtbl.SetTTL)
        CallbackFree(this.vtbl.GetTTL)
        CallbackFree(this.vtbl.SetAlias)
        CallbackFree(this.vtbl.GetAlias)
    }
}
