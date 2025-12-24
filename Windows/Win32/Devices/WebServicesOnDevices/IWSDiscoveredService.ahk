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
     * Retrieves a WS-Addressing address referencing an endpoint of the remote device.
     * @returns {Pointer<WSD_ENDPOINT_REFERENCE>} A WS-Addressing address referencing an endpoint of the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a>. Do not deallocate the output structure.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getendpointreference
     */
    GetEndpointReference() {
        result := ComCall(3, this, "ptr*", &ppEndpointReference := 0, "HRESULT")
        return ppEndpointReference
    }

    /**
     * Retrieves a list of WS-Discovery Types.
     * @returns {Pointer<WSD_NAME_LIST>} List of WS-Discovery Types provided in the Hello, ProbeMatch, or ResolveMatch message sent by the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a>. Do not deallocate the output structure.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-gettypes
     */
    GetTypes() {
        result := ComCall(4, this, "ptr*", &ppTypesList := 0, "HRESULT")
        return ppTypesList
    }

    /**
     * Retrieves a list of WS-Discovery Scopes.
     * @returns {Pointer<WSD_URI_LIST>} List of WS-Discovery Scopes provided in the Hello, ProbeMatch, or ResolveMatch message sent by the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a>. Do not deallocate the output structure.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getscopes
     */
    GetScopes() {
        result := ComCall(5, this, "ptr*", &ppScopesList := 0, "HRESULT")
        return ppScopesList
    }

    /**
     * Retrieves a list of WS-Discovery XAddrs.
     * @returns {Pointer<WSD_URI_LIST>} List of WS-Discovery XAddrs provided in the Hello, ProbeMatch, or ResolveMatch message sent by the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a>. Do not deallocate the output structure.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getxaddrs
     */
    GetXAddrs() {
        result := ComCall(6, this, "ptr*", &ppXAddrsList := 0, "HRESULT")
        return ppXAddrsList
    }

    /**
     * Retrieves the metadata version of this message.
     * @returns {Integer} Metadata version of this message.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getmetadataversion
     */
    GetMetadataVersion() {
        result := ComCall(7, this, "uint*", &pullMetadataVersion := 0, "HRESULT")
        return pullMetadataVersion
    }

    /**
     * Retrieves custom or extensible data provided in the header or body of the SOAP message.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppHeaderAny Custom data added to the header portion of the SOAP message. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>. Do not deallocate the output structure.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppBodyAny Custom data added to the body portion of the SOAP message. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>. Do not deallocate the output structure.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getextendeddiscoxml
     */
    GetExtendedDiscoXML(ppHeaderAny, ppBodyAny) {
        ppHeaderAnyMarshal := ppHeaderAny is VarRef ? "ptr*" : "ptr"
        ppBodyAnyMarshal := ppBodyAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, ppHeaderAnyMarshal, ppHeaderAny, ppBodyAnyMarshal, ppBodyAny, "HRESULT")
        return result
    }

    /**
     * Retrieves the search tag corresponding to this discovered service object.
     * @returns {PWSTR} Search tag passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> search method that this <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object corresponds to. If the <b>IWSDiscoveredService</b> is the result of a Hello message, the tag is <b>NULL</b>. Do not deallocate the output string.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getproberesolvetag
     */
    GetProbeResolveTag() {
        result := ComCall(9, this, "ptr*", &ppszTag := 0, "HRESULT")
        return ppszTag
    }

    /**
     * Retrieves the string representation of the remote transport (IP) address.
     * @returns {PWSTR} String representation of the remote transport (IP) address. Is <b>NULL</b> if not available.
     * Do not deallocate the output string.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getremotetransportaddress
     */
    GetRemoteTransportAddress() {
        result := ComCall(10, this, "ptr*", &ppszRemoteTransportAddress := 0, "HRESULT")
        return ppszRemoteTransportAddress
    }

    /**
     * Retrieves the string representation of the local transport (IP) address.
     * @returns {PWSTR} String representation of the local transport (IP) address. Is <b>NULL</b> if not available.
     * Do not deallocate the output string.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocaltransportaddress
     */
    GetLocalTransportAddress() {
        result := ComCall(11, this, "ptr*", &ppszLocalTransportAddress := 0, "HRESULT")
        return ppszLocalTransportAddress
    }

    /**
     * Retrieves the GUID of the local network interface over which the message was received.
     * @returns {Guid} GUID of the local network interface over which the message was received. Structure will be cleared if the local interface GUID is not available.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocalinterfaceguid
     */
    GetLocalInterfaceGUID() {
        pGuid := Guid()
        result := ComCall(12, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * Retrieves the instance identifier of this message.
     * @returns {Integer} A pointer to the instance identifier of this message.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveredservice-getinstanceid
     */
    GetInstanceId() {
        result := ComCall(13, this, "uint*", &pullInstanceId := 0, "HRESULT")
        return pullInstanceId
    }
}
