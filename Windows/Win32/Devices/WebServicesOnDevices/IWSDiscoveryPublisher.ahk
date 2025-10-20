#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for announcing hosts and managing incoming queries to hosts.
 * @remarks
 * 
  *  This interface represents the "server" or "host" side of <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoverypublisher
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryPublisher extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDiscoveryPublisher
     * @type {Guid}
     */
    static IID => Guid("{ae01e1a8-3ff9-4148-8116-057cc616fe13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAddressFamily", "RegisterNotificationSink", "UnRegisterNotificationSink", "Publish", "UnPublish", "MatchProbe", "MatchResolve", "PublishEx", "MatchProbeEx", "MatchResolveEx", "RegisterScopeMatchingRule", "UnRegisterScopeMatchingRule", "GetXMLContext"]

    /**
     * 
     * @param {Integer} dwAddressFamily 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-setaddressfamily
     */
    SetAddressFamily(dwAddressFamily) {
        result := ComCall(3, this, "uint", dwAddressFamily, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDiscoveryPublisherNotify} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registernotificationsink
     */
    RegisterNotificationSink(pSink) {
        result := ComCall(4, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDiscoveryPublisherNotify} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-unregisternotificationsink
     */
    UnRegisterNotificationSink(pSink) {
        result := ComCall(5, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @param {Integer} ullMetadataVersion 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-publish
     */
    Publish(pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(6, this, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-unpublish
     */
    UnPublish(pszId, ullInstanceId, ullMessageNumber, pszSessionId, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(7, this, "ptr", pszId, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_MESSAGE>} pProbeMessage 
     * @param {IWSDMessageParameters} pMessageParameters 
     * @param {PWSTR} pszId 
     * @param {Integer} ullMetadataVersion 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobe
     */
    MatchProbe(pProbeMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(8, this, "ptr", pProbeMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_MESSAGE>} pResolveMessage 
     * @param {IWSDMessageParameters} pMessageParameters 
     * @param {PWSTR} pszId 
     * @param {Integer} ullMetadataVersion 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchresolve
     */
    MatchResolve(pResolveMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(9, this, "ptr", pResolveMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @param {Integer} ullMetadataVersion 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList 
     * @param {Pointer<WSDXML_ELEMENT>} pHeaderAny 
     * @param {Pointer<WSDXML_ELEMENT>} pReferenceParameterAny 
     * @param {Pointer<WSDXML_ELEMENT>} pPolicyAny 
     * @param {Pointer<WSDXML_ELEMENT>} pEndpointReferenceAny 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-publishex
     */
    PublishEx(pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(10, this, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "ptr", pHeaderAny, "ptr", pReferenceParameterAny, "ptr", pPolicyAny, "ptr", pEndpointReferenceAny, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_MESSAGE>} pProbeMessage 
     * @param {IWSDMessageParameters} pMessageParameters 
     * @param {PWSTR} pszId 
     * @param {Integer} ullMetadataVersion 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList 
     * @param {Pointer<WSDXML_ELEMENT>} pHeaderAny 
     * @param {Pointer<WSDXML_ELEMENT>} pReferenceParameterAny 
     * @param {Pointer<WSDXML_ELEMENT>} pPolicyAny 
     * @param {Pointer<WSDXML_ELEMENT>} pEndpointReferenceAny 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobeex
     */
    MatchProbeEx(pProbeMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(11, this, "ptr", pProbeMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "ptr", pHeaderAny, "ptr", pReferenceParameterAny, "ptr", pPolicyAny, "ptr", pEndpointReferenceAny, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_MESSAGE>} pResolveMessage 
     * @param {IWSDMessageParameters} pMessageParameters 
     * @param {PWSTR} pszId 
     * @param {Integer} ullMetadataVersion 
     * @param {Integer} ullInstanceId 
     * @param {Integer} ullMessageNumber 
     * @param {PWSTR} pszSessionId 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {Pointer<WSD_URI_LIST>} pXAddrsList 
     * @param {Pointer<WSDXML_ELEMENT>} pHeaderAny 
     * @param {Pointer<WSDXML_ELEMENT>} pReferenceParameterAny 
     * @param {Pointer<WSDXML_ELEMENT>} pPolicyAny 
     * @param {Pointer<WSDXML_ELEMENT>} pEndpointReferenceAny 
     * @param {Pointer<WSDXML_ELEMENT>} pAny 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchresolveex
     */
    MatchResolveEx(pResolveMessage, pMessageParameters, pszId, ullMetadataVersion, ullInstanceId, ullMessageNumber, pszSessionId, pTypesList, pScopesList, pXAddrsList, pHeaderAny, pReferenceParameterAny, pPolicyAny, pEndpointReferenceAny, pAny) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId

        result := ComCall(12, this, "ptr", pResolveMessage, "ptr", pMessageParameters, "ptr", pszId, "uint", ullMetadataVersion, "uint", ullInstanceId, "uint", ullMessageNumber, "ptr", pszSessionId, "ptr", pTypesList, "ptr", pScopesList, "ptr", pXAddrsList, "ptr", pHeaderAny, "ptr", pReferenceParameterAny, "ptr", pPolicyAny, "ptr", pEndpointReferenceAny, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDScopeMatchingRule} pScopeMatchingRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-registerscopematchingrule
     */
    RegisterScopeMatchingRule(pScopeMatchingRule) {
        result := ComCall(13, this, "ptr", pScopeMatchingRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDScopeMatchingRule} pScopeMatchingRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-unregisterscopematchingrule
     */
    UnRegisterScopeMatchingRule(pScopeMatchingRule) {
        result := ComCall(14, this, "ptr", pScopeMatchingRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWSDXMLContext>} ppContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-getxmlcontext
     */
    GetXMLContext(ppContext) {
        result := ComCall(15, this, "ptr*", ppContext, "HRESULT")
        return result
    }
}
