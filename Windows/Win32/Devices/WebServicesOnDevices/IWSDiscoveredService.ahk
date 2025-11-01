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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEndpointReference", "GetTypes", "GetScopes", "GetXAddrs", "GetMetadataVersion", "GetExtendedDiscoXML", "GetProbeResolveTag", "GetRemoteTransportAddress", "GetLocalTransportAddress", "GetLocalInterfaceGUID", "GetInstanceId"]

    /**
     * 
     * @param {Pointer<Pointer<WSD_ENDPOINT_REFERENCE>>} ppEndpointReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getendpointreference
     */
    GetEndpointReference(ppEndpointReference) {
        result := ComCall(3, this, "ptr*", ppEndpointReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSD_NAME_LIST>>} ppTypesList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-gettypes
     */
    GetTypes(ppTypesList) {
        result := ComCall(4, this, "ptr*", ppTypesList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSD_URI_LIST>>} ppScopesList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getscopes
     */
    GetScopes(ppScopesList) {
        result := ComCall(5, this, "ptr*", ppScopesList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSD_URI_LIST>>} ppXAddrsList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getxaddrs
     */
    GetXAddrs(ppXAddrsList) {
        result := ComCall(6, this, "ptr*", ppXAddrsList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullMetadataVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getmetadataversion
     */
    GetMetadataVersion(pullMetadataVersion) {
        pullMetadataVersionMarshal := pullMetadataVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pullMetadataVersionMarshal, pullMetadataVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppHeaderAny 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppBodyAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getextendeddiscoxml
     */
    GetExtendedDiscoXML(ppHeaderAny, ppBodyAny) {
        result := ComCall(8, this, "ptr*", ppHeaderAny, "ptr*", ppBodyAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getproberesolvetag
     */
    GetProbeResolveTag(ppszTag) {
        result := ComCall(9, this, "ptr", ppszTag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszRemoteTransportAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getremotetransportaddress
     */
    GetRemoteTransportAddress(ppszRemoteTransportAddress) {
        result := ComCall(10, this, "ptr", ppszRemoteTransportAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLocalTransportAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocaltransportaddress
     */
    GetLocalTransportAddress(ppszLocalTransportAddress) {
        result := ComCall(11, this, "ptr", ppszLocalTransportAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocalinterfaceguid
     */
    GetLocalInterfaceGUID(pGuid) {
        result := ComCall(12, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullInstanceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getinstanceid
     */
    GetInstanceId(pullInstanceId) {
        pullInstanceIdMarshal := pullInstanceId is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pullInstanceIdMarshal, pullInstanceId, "HRESULT")
        return result
    }
}
