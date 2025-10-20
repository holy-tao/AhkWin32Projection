#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface represents a remotely discovered host.
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoveredservice
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveredService extends IUnknown{
    /**
     * The interface identifier for IWSDiscoveredService
     * @type {Guid}
     */
    static IID => Guid("{4bad8a3b-b374-4420-9632-aac945b374aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<WSD_ENDPOINT_REFERENCE>} ppEndpointReference 
     * @returns {HRESULT} 
     */
    GetEndpointReference(ppEndpointReference) {
        result := ComCall(3, this, "ptr", ppEndpointReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_NAME_LIST>} ppTypesList 
     * @returns {HRESULT} 
     */
    GetTypes(ppTypesList) {
        result := ComCall(4, this, "ptr", ppTypesList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_URI_LIST>} ppScopesList 
     * @returns {HRESULT} 
     */
    GetScopes(ppScopesList) {
        result := ComCall(5, this, "ptr", ppScopesList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_URI_LIST>} ppXAddrsList 
     * @returns {HRESULT} 
     */
    GetXAddrs(ppXAddrsList) {
        result := ComCall(6, this, "ptr", ppXAddrsList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pullMetadataVersion 
     * @returns {HRESULT} 
     */
    GetMetadataVersion(pullMetadataVersion) {
        result := ComCall(7, this, "uint*", pullMetadataVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSDXML_ELEMENT>} ppHeaderAny 
     * @param {Pointer<WSDXML_ELEMENT>} ppBodyAny 
     * @returns {HRESULT} 
     */
    GetExtendedDiscoXML(ppHeaderAny, ppBodyAny) {
        result := ComCall(8, this, "ptr", ppHeaderAny, "ptr", ppBodyAny, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTag 
     * @returns {HRESULT} 
     */
    GetProbeResolveTag(ppszTag) {
        result := ComCall(9, this, "ptr", ppszTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszRemoteTransportAddress 
     * @returns {HRESULT} 
     */
    GetRemoteTransportAddress(ppszRemoteTransportAddress) {
        result := ComCall(10, this, "ptr", ppszRemoteTransportAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLocalTransportAddress 
     * @returns {HRESULT} 
     */
    GetLocalTransportAddress(ppszLocalTransportAddress) {
        result := ComCall(11, this, "ptr", ppszLocalTransportAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetLocalInterfaceGUID(pGuid) {
        result := ComCall(12, this, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pullInstanceId 
     * @returns {HRESULT} 
     */
    GetInstanceId(pullInstanceId) {
        result := ComCall(13, this, "uint*", pullInstanceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
