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
     * 
     * @param {Pointer<IWdsTransportSession>} ppWdsTransportSession 
     * @returns {HRESULT} 
     */
    get_Session(ppWdsTransportSession) {
        result := ComCall(7, this, "ptr", ppWdsTransportSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulId 
     * @returns {HRESULT} 
     */
    get_Id(pulId) {
        result := ComCall(8, this, "uint*", pulId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszName 
     * @returns {HRESULT} 
     */
    get_Name(pbszName) {
        result := ComCall(9, this, "ptr", pbszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszMacAddress 
     * @returns {HRESULT} 
     */
    get_MacAddress(pbszMacAddress) {
        result := ComCall(10, this, "ptr", pbszMacAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszIpAddress 
     * @returns {HRESULT} 
     */
    get_IpAddress(pbszIpAddress) {
        result := ComCall(11, this, "ptr", pbszIpAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulPercentCompletion 
     * @returns {HRESULT} 
     */
    get_PercentCompletion(pulPercentCompletion) {
        result := ComCall(12, this, "uint*", pulPercentCompletion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulJoinDuration 
     * @returns {HRESULT} 
     */
    get_JoinDuration(pulJoinDuration) {
        result := ComCall(13, this, "uint*", pulJoinDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulCpuUtilization 
     * @returns {HRESULT} 
     */
    get_CpuUtilization(pulCpuUtilization) {
        result := ComCall(14, this, "uint*", pulCpuUtilization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulMemoryUtilization 
     * @returns {HRESULT} 
     */
    get_MemoryUtilization(pulMemoryUtilization) {
        result := ComCall(15, this, "uint*", pulMemoryUtilization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulNetworkUtilization 
     * @returns {HRESULT} 
     */
    get_NetworkUtilization(pulNetworkUtilization) {
        result := ComCall(16, this, "uint*", pulNetworkUtilization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszUserIdentity 
     * @returns {HRESULT} 
     */
    get_UserIdentity(pbszUserIdentity) {
        result := ComCall(17, this, "ptr", pbszUserIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DisconnectionType 
     * @returns {HRESULT} 
     */
    Disconnect(DisconnectionType) {
        result := ComCall(18, this, "int", DisconnectionType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
