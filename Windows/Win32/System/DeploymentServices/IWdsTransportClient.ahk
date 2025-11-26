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
     * 
     * @returns {IWdsTransportSession} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_session
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppWdsTransportSession := 0, "HRESULT")
        return IWdsTransportSession(ppWdsTransportSession)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_id
     */
    get_Id() {
        result := ComCall(8, this, "uint*", &pulId := 0, "HRESULT")
        return pulId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_name
     */
    get_Name() {
        pbszName := BSTR()
        result := ComCall(9, this, "ptr", pbszName, "HRESULT")
        return pbszName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_macaddress
     */
    get_MacAddress() {
        pbszMacAddress := BSTR()
        result := ComCall(10, this, "ptr", pbszMacAddress, "HRESULT")
        return pbszMacAddress
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_ipaddress
     */
    get_IpAddress() {
        pbszIpAddress := BSTR()
        result := ComCall(11, this, "ptr", pbszIpAddress, "HRESULT")
        return pbszIpAddress
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_percentcompletion
     */
    get_PercentCompletion() {
        result := ComCall(12, this, "uint*", &pulPercentCompletion := 0, "HRESULT")
        return pulPercentCompletion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_joinduration
     */
    get_JoinDuration() {
        result := ComCall(13, this, "uint*", &pulJoinDuration := 0, "HRESULT")
        return pulJoinDuration
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_cpuutilization
     */
    get_CpuUtilization() {
        result := ComCall(14, this, "uint*", &pulCpuUtilization := 0, "HRESULT")
        return pulCpuUtilization
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_memoryutilization
     */
    get_MemoryUtilization() {
        result := ComCall(15, this, "uint*", &pulMemoryUtilization := 0, "HRESULT")
        return pulMemoryUtilization
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_networkutilization
     */
    get_NetworkUtilization() {
        result := ComCall(16, this, "uint*", &pulNetworkUtilization := 0, "HRESULT")
        return pulNetworkUtilization
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_useridentity
     */
    get_UserIdentity() {
        pbszUserIdentity := BSTR()
        result := ComCall(17, this, "ptr", pbszUserIdentity, "HRESULT")
        return pbszUserIdentity
    }

    /**
     * 
     * @param {Integer} DisconnectionType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-disconnect
     */
    Disconnect(DisconnectionType) {
        result := ComCall(18, this, "int", DisconnectionType, "HRESULT")
        return result
    }
}
