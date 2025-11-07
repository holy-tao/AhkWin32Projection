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
     * @returns {Pointer<WSD_ENDPOINT_REFERENCE>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getendpointreference
     */
    GetEndpointReference() {
        result := ComCall(3, this, "ptr*", &ppEndpointReference := 0, "HRESULT")
        return ppEndpointReference
    }

    /**
     * 
     * @returns {Pointer<WSD_NAME_LIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-gettypes
     */
    GetTypes() {
        result := ComCall(4, this, "ptr*", &ppTypesList := 0, "HRESULT")
        return ppTypesList
    }

    /**
     * 
     * @returns {Pointer<WSD_URI_LIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getscopes
     */
    GetScopes() {
        result := ComCall(5, this, "ptr*", &ppScopesList := 0, "HRESULT")
        return ppScopesList
    }

    /**
     * 
     * @returns {Pointer<WSD_URI_LIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getxaddrs
     */
    GetXAddrs() {
        result := ComCall(6, this, "ptr*", &ppXAddrsList := 0, "HRESULT")
        return ppXAddrsList
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getmetadataversion
     */
    GetMetadataVersion() {
        result := ComCall(7, this, "uint*", &pullMetadataVersion := 0, "HRESULT")
        return pullMetadataVersion
    }

    /**
     * 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppHeaderAny 
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppBodyAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getextendeddiscoxml
     */
    GetExtendedDiscoXML(ppHeaderAny, ppBodyAny) {
        ppHeaderAnyMarshal := ppHeaderAny is VarRef ? "ptr*" : "ptr"
        ppBodyAnyMarshal := ppBodyAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, ppHeaderAnyMarshal, ppHeaderAny, ppBodyAnyMarshal, ppBodyAny, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getproberesolvetag
     */
    GetProbeResolveTag() {
        result := ComCall(9, this, "ptr*", &ppszTag := 0, "HRESULT")
        return ppszTag
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getremotetransportaddress
     */
    GetRemoteTransportAddress() {
        result := ComCall(10, this, "ptr*", &ppszRemoteTransportAddress := 0, "HRESULT")
        return ppszRemoteTransportAddress
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocaltransportaddress
     */
    GetLocalTransportAddress() {
        result := ComCall(11, this, "ptr*", &ppszLocalTransportAddress := 0, "HRESULT")
        return ppszLocalTransportAddress
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocalinterfaceguid
     */
    GetLocalInterfaceGUID() {
        pGuid := Guid()
        result := ComCall(12, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getinstanceid
     */
    GetInstanceId() {
        result := ComCall(13, this, "uint*", &pullInstanceId := 0, "HRESULT")
        return pullInstanceId
    }
}
