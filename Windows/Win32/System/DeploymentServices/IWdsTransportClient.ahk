#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IWdsTransportSession>} ppWdsTransportSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_session
     */
    get_Session(ppWdsTransportSession) {
        result := ComCall(7, this, "ptr*", ppWdsTransportSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_id
     */
    get_Id(pulId) {
        pulIdMarshal := pulId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulIdMarshal, pulId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_name
     */
    get_Name(pbszName) {
        result := ComCall(9, this, "ptr", pbszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszMacAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_macaddress
     */
    get_MacAddress(pbszMacAddress) {
        result := ComCall(10, this, "ptr", pbszMacAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_ipaddress
     */
    get_IpAddress(pbszIpAddress) {
        result := ComCall(11, this, "ptr", pbszIpAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulPercentCompletion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_percentcompletion
     */
    get_PercentCompletion(pulPercentCompletion) {
        pulPercentCompletionMarshal := pulPercentCompletion is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pulPercentCompletionMarshal, pulPercentCompletion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulJoinDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_joinduration
     */
    get_JoinDuration(pulJoinDuration) {
        pulJoinDurationMarshal := pulJoinDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pulJoinDurationMarshal, pulJoinDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulCpuUtilization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_cpuutilization
     */
    get_CpuUtilization(pulCpuUtilization) {
        pulCpuUtilizationMarshal := pulCpuUtilization is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pulCpuUtilizationMarshal, pulCpuUtilization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulMemoryUtilization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_memoryutilization
     */
    get_MemoryUtilization(pulMemoryUtilization) {
        pulMemoryUtilizationMarshal := pulMemoryUtilization is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pulMemoryUtilizationMarshal, pulMemoryUtilization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulNetworkUtilization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_networkutilization
     */
    get_NetworkUtilization(pulNetworkUtilization) {
        pulNetworkUtilizationMarshal := pulNetworkUtilization is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pulNetworkUtilizationMarshal, pulNetworkUtilization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszUserIdentity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportclient-get_useridentity
     */
    get_UserIdentity(pbszUserIdentity) {
        result := ComCall(17, this, "ptr", pbszUserIdentity, "HRESULT")
        return result
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
