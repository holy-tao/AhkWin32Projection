#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWdsTransportSession.ahk" { IWdsTransportSession }
#Import ".\WDSTRANSPORT_DISCONNECT_TYPE.ahk" { WDSTRANSPORT_DISCONNECT_TYPE }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a WDS client that is joined to a transport session on a WDS transport server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportclient
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportClient extends IDispatch {
    /**
     * The interface identifier for IWdsTransportClient
     * @type {Guid}
     */
    static IID := Guid("{b5dbc93a-cabe-46ca-837f-3e44e93c6545}")

    /**
     * The class identifier for WdsTransportClient
     * @type {Guid}
     */
    static CLSID := Guid("{66d2c5e9-0ff6-49ec-9733-dafb1e01df1c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportClient interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session            : IntPtr
        get_Id                 : IntPtr
        get_Name               : IntPtr
        get_MacAddress         : IntPtr
        get_IpAddress          : IntPtr
        get_PercentCompletion  : IntPtr
        get_JoinDuration       : IntPtr
        get_CpuUtilization     : IntPtr
        get_MemoryUtilization  : IntPtr
        get_NetworkUtilization : IntPtr
        get_UserIdentity       : IntPtr
        Disconnect             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWdsTransportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    MacAddress {
        get => this.get_MacAddress()
    }

    /**
     * @type {BSTR} 
     */
    IpAddress {
        get => this.get_IpAddress()
    }

    /**
     * @type {Integer} 
     */
    PercentCompletion {
        get => this.get_PercentCompletion()
    }

    /**
     * @type {Integer} 
     */
    JoinDuration {
        get => this.get_JoinDuration()
    }

    /**
     * @type {Integer} 
     */
    CpuUtilization {
        get => this.get_CpuUtilization()
    }

    /**
     * @type {Integer} 
     */
    MemoryUtilization {
        get => this.get_MemoryUtilization()
    }

    /**
     * @type {Integer} 
     */
    NetworkUtilization {
        get => this.get_NetworkUtilization()
    }

    /**
     * @type {BSTR} 
     */
    UserIdentity {
        get => this.get_UserIdentity()
    }

    /**
     * Receives the transport session to which the WDS client is joined.
     * @returns {IWdsTransportSession} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_session
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportSession := 0, "HRESULT")
        return IWdsTransportSession(ppWdsTransportSession)
    }

    /**
     * Receives a unique client ID that identifies this WDS client on the WDS server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Receives the name of the WDS client on the WDS server.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_name
     */
    get_Name() {
        pbszName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbszName, "HRESULT")
        return pbszName
    }

    /**
     * Receives the MAC address of the WDS client.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_macaddress
     */
    get_MacAddress() {
        pbszMacAddress := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbszMacAddress, "HRESULT")
        return pbszMacAddress
    }

    /**
     * Receives a string value that contains the IP address of the WDS client.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_ipaddress
     */
    get_IpAddress() {
        pbszIpAddress := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbszIpAddress, "HRESULT")
        return pbszIpAddress
    }

    /**
     * Receives the percentage of the current object that has been downloaded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_percentcompletion
     */
    get_PercentCompletion() {
        result := ComCall(12, this, "uint*", &pulPercentCompletion := 0, "HRESULT")
        return pulPercentCompletion
    }

    /**
     * Receives the time elapsed, in seconds, since the WDS client joined to the transport session.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_joinduration
     */
    get_JoinDuration() {
        result := ComCall(13, this, "uint*", &pulJoinDuration := 0, "HRESULT")
        return pulJoinDuration
    }

    /**
     * Receives the percentage of the WDS client’s CPU utilization.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_cpuutilization
     */
    get_CpuUtilization() {
        result := ComCall(14, this, "uint*", &pulCpuUtilization := 0, "HRESULT")
        return pulCpuUtilization
    }

    /**
     * Receives the percentage of the WDS client’s memory in use.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_memoryutilization
     */
    get_MemoryUtilization() {
        result := ComCall(15, this, "uint*", &pulMemoryUtilization := 0, "HRESULT")
        return pulMemoryUtilization
    }

    /**
     * Receives the percentage of the WDS client’s network bandwidth used.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_networkutilization
     */
    get_NetworkUtilization() {
        result := ComCall(16, this, "uint*", &pulNetworkUtilization := 0, "HRESULT")
        return pulNetworkUtilization
    }

    /**
     * Receives a string representing the user identity associated with this client.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_useridentity
     */
    get_UserIdentity() {
        pbszUserIdentity := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbszUserIdentity, "HRESULT")
        return pbszUserIdentity
    }

    /**
     * Disconnects the WDS client from the session and specifies what action the client should take upon disconnection.
     * @param {WDSTRANSPORT_DISCONNECT_TYPE} DisconnectionType A value of the <a href="https://docs.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_disconnect_type">WDSTRANSPORT_DISCONNECT_TYPE</a> enumeration that specifies what action the WDS client should take when disconnected.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-disconnect
     */
    Disconnect(DisconnectionType) {
        result := ComCall(18, this, WDSTRANSPORT_DISCONNECT_TYPE, DisconnectionType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_MacAddress := CallbackCreate(GetMethod(implObj, "get_MacAddress"), flags, 2)
        this.vtbl.get_IpAddress := CallbackCreate(GetMethod(implObj, "get_IpAddress"), flags, 2)
        this.vtbl.get_PercentCompletion := CallbackCreate(GetMethod(implObj, "get_PercentCompletion"), flags, 2)
        this.vtbl.get_JoinDuration := CallbackCreate(GetMethod(implObj, "get_JoinDuration"), flags, 2)
        this.vtbl.get_CpuUtilization := CallbackCreate(GetMethod(implObj, "get_CpuUtilization"), flags, 2)
        this.vtbl.get_MemoryUtilization := CallbackCreate(GetMethod(implObj, "get_MemoryUtilization"), flags, 2)
        this.vtbl.get_NetworkUtilization := CallbackCreate(GetMethod(implObj, "get_NetworkUtilization"), flags, 2)
        this.vtbl.get_UserIdentity := CallbackCreate(GetMethod(implObj, "get_UserIdentity"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_MacAddress)
        CallbackFree(this.vtbl.get_IpAddress)
        CallbackFree(this.vtbl.get_PercentCompletion)
        CallbackFree(this.vtbl.get_JoinDuration)
        CallbackFree(this.vtbl.get_CpuUtilization)
        CallbackFree(this.vtbl.get_MemoryUtilization)
        CallbackFree(this.vtbl.get_NetworkUtilization)
        CallbackFree(this.vtbl.get_UserIdentity)
        CallbackFree(this.vtbl.Disconnect)
    }
}
