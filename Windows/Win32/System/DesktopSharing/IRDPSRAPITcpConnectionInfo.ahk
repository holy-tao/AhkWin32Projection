#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Supports the methods to retrieve the TCP connection information on the viewer and on the sharer side.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapitcpconnectioninfo
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPITcpConnectionInfo extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPITcpConnectionInfo
     * @type {Guid}
     */
    static IID := Guid("{f74049a4-3d06-4028-8193-0a8c29bc2452}")

    /**
     * The class identifier for RDPSRAPITcpConnectionInfo
     * @type {Guid}
     */
    static CLSID := Guid("{be49db3f-ebb6-4278-8ce0-d5455833eaee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPITcpConnectionInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Protocol  : IntPtr
        get_LocalPort : IntPtr
        get_LocalIP   : IntPtr
        get_PeerPort  : IntPtr
        get_PeerIP    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPITcpConnectionInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * @type {Integer} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

    /**
     * @type {BSTR} 
     */
    LocalIP {
        get => this.get_LocalIP()
    }

    /**
     * @type {Integer} 
     */
    PeerPort {
        get => this.get_PeerPort()
    }

    /**
     * @type {BSTR} 
     */
    PeerIP {
        get => this.get_PeerIP()
    }

    /**
     * Retrieves the protocol that is being used by the sharer or by the viewer for communication.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_protocol
     */
    get_Protocol() {
        result := ComCall(7, this, "int*", &plProtocol := 0, "HRESULT")
        return plProtocol
    }

    /**
     * Retrieves the local port that is being used by the sharer or by the viewer in communication.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_localport
     */
    get_LocalPort() {
        result := ComCall(8, this, "int*", &plPort := 0, "HRESULT")
        return plPort
    }

    /**
     * Retrieves the local IP address that is being used by the sharer or by the viewer for communication.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_localip
     */
    get_LocalIP() {
        pbsrLocalIP := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbsrLocalIP, "HRESULT")
        return pbsrLocalIP
    }

    /**
     * Retrieves the remote port that is being used by the sharer or by the viewer in communication.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_peerport
     */
    get_PeerPort() {
        result := ComCall(10, this, "int*", &plPort := 0, "HRESULT")
        return plPort
    }

    /**
     * Retrieves the remote IP address that is being used by the sharer or by the viewer in communication.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_peerip
     */
    get_PeerIP() {
        pbstrIP := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrIP, "HRESULT")
        return pbstrIP
    }

    Query(iid) {
        if (IRDPSRAPITcpConnectionInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Protocol := CallbackCreate(GetMethod(implObj, "get_Protocol"), flags, 2)
        this.vtbl.get_LocalPort := CallbackCreate(GetMethod(implObj, "get_LocalPort"), flags, 2)
        this.vtbl.get_LocalIP := CallbackCreate(GetMethod(implObj, "get_LocalIP"), flags, 2)
        this.vtbl.get_PeerPort := CallbackCreate(GetMethod(implObj, "get_PeerPort"), flags, 2)
        this.vtbl.get_PeerIP := CallbackCreate(GetMethod(implObj, "get_PeerIP"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Protocol)
        CallbackFree(this.vtbl.get_LocalPort)
        CallbackFree(this.vtbl.get_LocalIP)
        CallbackFree(this.vtbl.get_PeerPort)
        CallbackFree(this.vtbl.get_PeerIP)
    }
}
