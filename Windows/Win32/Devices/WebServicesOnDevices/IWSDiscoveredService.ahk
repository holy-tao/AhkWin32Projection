#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSD_URI_LIST.ahk" { WSD_URI_LIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WSD_NAME_LIST.ahk" { WSD_NAME_LIST }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }

/**
 * This interface represents a remotely discovered host.
 * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nn-wsddisco-iwsdiscoveredservice
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDiscoveredService extends IUnknown {
    /**
     * The interface identifier for IWSDiscoveredService
     * @type {Guid}
     */
    static IID := Guid("{4bad8a3b-b374-4420-9632-aac945b374aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDiscoveredService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEndpointReference      : IntPtr
        GetTypes                  : IntPtr
        GetScopes                 : IntPtr
        GetXAddrs                 : IntPtr
        GetMetadataVersion        : IntPtr
        GetExtendedDiscoXML       : IntPtr
        GetProbeResolveTag        : IntPtr
        GetRemoteTransportAddress : IntPtr
        GetLocalTransportAddress  : IntPtr
        GetLocalInterfaceGUID     : IntPtr
        GetInstanceId             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDiscoveredService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a WS-Addressing address referencing an endpoint of the remote device.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * @returns {Pointer<WSD_ENDPOINT_REFERENCE>} A WS-Addressing address referencing an endpoint of the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a>. Do not deallocate the output structure.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getendpointreference
     */
    GetEndpointReference() {
        result := ComCall(3, this, "ptr*", &ppEndpointReference := 0, "HRESULT")
        return ppEndpointReference
    }

    /**
     * Retrieves a list of WS-Discovery Types.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * @returns {Pointer<WSD_NAME_LIST>} List of WS-Discovery Types provided in the Hello, ProbeMatch, or ResolveMatch message sent by the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a>. Do not deallocate the output structure.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-gettypes
     */
    GetTypes() {
        result := ComCall(4, this, "ptr*", &ppTypesList := 0, "HRESULT")
        return ppTypesList
    }

    /**
     * Retrieves a list of WS-Discovery Scopes.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * @returns {Pointer<WSD_URI_LIST>} List of WS-Discovery Scopes provided in the Hello, ProbeMatch, or ResolveMatch message sent by the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a>. Do not deallocate the output structure.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getscopes
     */
    GetScopes() {
        result := ComCall(5, this, "ptr*", &ppScopesList := 0, "HRESULT")
        return ppScopesList
    }

    /**
     * Retrieves a list of WS-Discovery XAddrs.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * @returns {Pointer<WSD_URI_LIST>} List of WS-Discovery XAddrs provided in the Hello, ProbeMatch, or ResolveMatch message sent by the remote device. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a>. Do not deallocate the output structure.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getxaddrs
     */
    GetXAddrs() {
        result := ComCall(6, this, "ptr*", &ppXAddrsList := 0, "HRESULT")
        return ppXAddrsList
    }

    /**
     * Retrieves the metadata version of this message.
     * @remarks
     * Versioning is used to determine if metadata exchange should be performed again due to a state change on the device.
     * @returns {Integer} Metadata version of this message.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getmetadataversion
     */
    GetMetadataVersion() {
        result := ComCall(7, this, "uint*", &pullMetadataVersion := 0, "HRESULT")
        return pullMetadataVersion
    }

    /**
     * Retrieves custom or extensible data provided in the header or body of the SOAP message.
     * @remarks
     * Some devices may add custom data to the header and body portions of the SOAP message to convey additional information in the discovery phase.
     * 
     * The resulting pointer values are  only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getextendeddiscoxml
     */
    GetExtendedDiscoXML(ppHeaderAny, ppBodyAny) {
        ppHeaderAnyMarshal := ppHeaderAny is VarRef ? "ptr*" : "ptr"
        ppBodyAnyMarshal := ppBodyAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, ppHeaderAnyMarshal, ppHeaderAny, ppBodyAnyMarshal, ppBodyAny, "HRESULT")
        return result
    }

    /**
     * Retrieves the search tag corresponding to this discovered service object.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * @returns {PWSTR} Search tag passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> search method that this <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object corresponds to. If the <b>IWSDiscoveredService</b> is the result of a Hello message, the tag is <b>NULL</b>. Do not deallocate the output string.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getproberesolvetag
     */
    GetProbeResolveTag() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszTag := 0, "HRESULT")
        return ppszTag
    }

    /**
     * Retrieves the string representation of the remote transport (IP) address.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * 
     * The string returned by this method may contain an IPv4 or unbracketed IPv6 address such as "fe80::1".  It may also contain a bracketed IPv6 address that includes the port such as "[fe80::1]:1234".  The caller should parse the string carefully to account for both possibilities.
     * @returns {PWSTR} String representation of the remote transport (IP) address. Is <b>NULL</b> if not available.
     * Do not deallocate the output string.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getremotetransportaddress
     */
    GetRemoteTransportAddress() {
        result := ComCall(10, this, PWSTR.Ptr, &ppszRemoteTransportAddress := 0, "HRESULT")
        return ppszRemoteTransportAddress
    }

    /**
     * Retrieves the string representation of the local transport (IP) address.
     * @remarks
     * The resulting pointer value is only valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> object.
     * @returns {PWSTR} String representation of the local transport (IP) address. Is <b>NULL</b> if not available.
     * Do not deallocate the output string.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocaltransportaddress
     */
    GetLocalTransportAddress() {
        result := ComCall(11, this, PWSTR.Ptr, &ppszLocalTransportAddress := 0, "HRESULT")
        return ppszLocalTransportAddress
    }

    /**
     * Retrieves the GUID of the local network interface over which the message was received.
     * @returns {Guid} GUID of the local network interface over which the message was received. Structure will be cleared if the local interface GUID is not available.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getlocalinterfaceguid
     */
    GetLocalInterfaceGUID() {
        pGuid := Guid()
        result := ComCall(12, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * Retrieves the instance identifier of this message.
     * @returns {Integer} A pointer to the instance identifier of this message.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveredservice-getinstanceid
     */
    GetInstanceId() {
        result := ComCall(13, this, "uint*", &pullInstanceId := 0, "HRESULT")
        return pullInstanceId
    }

    Query(iid) {
        if (IWSDiscoveredService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEndpointReference := CallbackCreate(GetMethod(implObj, "GetEndpointReference"), flags, 2)
        this.vtbl.GetTypes := CallbackCreate(GetMethod(implObj, "GetTypes"), flags, 2)
        this.vtbl.GetScopes := CallbackCreate(GetMethod(implObj, "GetScopes"), flags, 2)
        this.vtbl.GetXAddrs := CallbackCreate(GetMethod(implObj, "GetXAddrs"), flags, 2)
        this.vtbl.GetMetadataVersion := CallbackCreate(GetMethod(implObj, "GetMetadataVersion"), flags, 2)
        this.vtbl.GetExtendedDiscoXML := CallbackCreate(GetMethod(implObj, "GetExtendedDiscoXML"), flags, 3)
        this.vtbl.GetProbeResolveTag := CallbackCreate(GetMethod(implObj, "GetProbeResolveTag"), flags, 2)
        this.vtbl.GetRemoteTransportAddress := CallbackCreate(GetMethod(implObj, "GetRemoteTransportAddress"), flags, 2)
        this.vtbl.GetLocalTransportAddress := CallbackCreate(GetMethod(implObj, "GetLocalTransportAddress"), flags, 2)
        this.vtbl.GetLocalInterfaceGUID := CallbackCreate(GetMethod(implObj, "GetLocalInterfaceGUID"), flags, 2)
        this.vtbl.GetInstanceId := CallbackCreate(GetMethod(implObj, "GetInstanceId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEndpointReference)
        CallbackFree(this.vtbl.GetTypes)
        CallbackFree(this.vtbl.GetScopes)
        CallbackFree(this.vtbl.GetXAddrs)
        CallbackFree(this.vtbl.GetMetadataVersion)
        CallbackFree(this.vtbl.GetExtendedDiscoXML)
        CallbackFree(this.vtbl.GetProbeResolveTag)
        CallbackFree(this.vtbl.GetRemoteTransportAddress)
        CallbackFree(this.vtbl.GetLocalTransportAddress)
        CallbackFree(this.vtbl.GetLocalInterfaceGUID)
        CallbackFree(this.vtbl.GetInstanceId)
    }
}
