#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportSession.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a WDS client that is joined to a transport session on a WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportclient
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportClient extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportClient
     * @type {Guid}
     */
    static IID => Guid("{b5dbc93a-cabe-46ca-837f-3e44e93c6545}")

    /**
     * The class identifier for WdsTransportClient
     * @type {Guid}
     */
    static CLSID => Guid("{66d2c5e9-0ff6-49ec-9733-dafb1e01df1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_Id", "get_Name", "get_MacAddress", "get_IpAddress", "get_PercentCompletion", "get_JoinDuration", "get_CpuUtilization", "get_MemoryUtilization", "get_NetworkUtilization", "get_UserIdentity", "Disconnect"]

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
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_session
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportSession := 0, "HRESULT")
        return IWdsTransportSession(ppWdsTransportSession)
    }

    /**
     * Receives a unique client ID that identifies this WDS client on the WDS server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * Receives the name of the WDS client on the WDS server.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_name
     */
    get_Name() {
        pbszName := BSTR()
        result := ComCall(9, this, "ptr", pbszName, "HRESULT")
        return pbszName
    }

    /**
     * Receives the MAC address of the WDS client.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_macaddress
     */
    get_MacAddress() {
        pbszMacAddress := BSTR()
        result := ComCall(10, this, "ptr", pbszMacAddress, "HRESULT")
        return pbszMacAddress
    }

    /**
     * Receives a string value that contains the IP address of the WDS client.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_ipaddress
     */
    get_IpAddress() {
        pbszIpAddress := BSTR()
        result := ComCall(11, this, "ptr", pbszIpAddress, "HRESULT")
        return pbszIpAddress
    }

    /**
     * Receives the percentage of the current object that has been downloaded.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_percentcompletion
     */
    get_PercentCompletion() {
        result := ComCall(12, this, "uint*", &pulPercentCompletion := 0, "HRESULT")
        return pulPercentCompletion
    }

    /**
     * Receives the time elapsed, in seconds, since the WDS client joined to the transport session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_joinduration
     */
    get_JoinDuration() {
        result := ComCall(13, this, "uint*", &pulJoinDuration := 0, "HRESULT")
        return pulJoinDuration
    }

    /**
     * Receives the percentage of the WDS client’s CPU utilization.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_cpuutilization
     */
    get_CpuUtilization() {
        result := ComCall(14, this, "uint*", &pulCpuUtilization := 0, "HRESULT")
        return pulCpuUtilization
    }

    /**
     * Receives the percentage of the WDS client’s memory in use.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_memoryutilization
     */
    get_MemoryUtilization() {
        result := ComCall(15, this, "uint*", &pulMemoryUtilization := 0, "HRESULT")
        return pulMemoryUtilization
    }

    /**
     * Receives the percentage of the WDS client’s network bandwidth used.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_networkutilization
     */
    get_NetworkUtilization() {
        result := ComCall(16, this, "uint*", &pulNetworkUtilization := 0, "HRESULT")
        return pulNetworkUtilization
    }

    /**
     * Receives a string representing the user identity associated with this client.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_useridentity
     */
    get_UserIdentity() {
        pbszUserIdentity := BSTR()
        result := ComCall(17, this, "ptr", pbszUserIdentity, "HRESULT")
        return pbszUserIdentity
    }

    /**
     * Disconnects the WDS client from the session and specifies what action the client should take upon disconnection.
     * @param {Integer} DisconnectionType A value of the <a href="https://docs.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_disconnect_type">WDSTRANSPORT_DISCONNECT_TYPE</a> enumeration that specifies what action the WDS client should take when disconnected.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-disconnect
     */
    Disconnect(DisconnectionType) {
        result := ComCall(18, this, "int", DisconnectionType, "HRESULT")
        return result
    }
}
