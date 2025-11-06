#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDXMLContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to discover services on the network advertised by WS-Discovery.
 * @remarks
 * 
  * The Discovery Provider represents the "client" view of WS-Discovery.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoveryprovider
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDiscoveryProvider
     * @type {Guid}
     */
    static IID => Guid("{8ffc8e55-f0eb-480f-88b7-b435dd281d45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAddressFamily", "Attach", "Detach", "SearchById", "SearchByAddress", "SearchByType", "GetXMLContext"]

    /**
     * 
     * @param {Integer} dwAddressFamily 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-setaddressfamily
     */
    SetAddressFamily(dwAddressFamily) {
        result := ComCall(3, this, "uint", dwAddressFamily, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDiscoveryProviderNotify} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-attach
     */
    Attach(pSink) {
        result := ComCall(4, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-detach
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszId 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyid
     */
    SearchById(pszId, pszTag) {
        pszId := pszId is String ? StrPtr(pszId) : pszId
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszId, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAddress 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyaddress
     */
    SearchByAddress(pszAddress, pszTag) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(7, this, "ptr", pszAddress, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_NAME_LIST>} pTypesList 
     * @param {Pointer<WSD_URI_LIST>} pScopesList 
     * @param {PWSTR} pszMatchBy 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbytype
     */
    SearchByType(pTypesList, pScopesList, pszMatchBy, pszTag) {
        pszMatchBy := pszMatchBy is String ? StrPtr(pszMatchBy) : pszMatchBy
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(8, this, "ptr", pTypesList, "ptr", pScopesList, "ptr", pszMatchBy, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWSDXMLContext} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-getxmlcontext
     */
    GetXMLContext() {
        result := ComCall(9, this, "ptr*", &ppContext := 0, "HRESULT")
        return IWSDXMLContext(ppContext)
    }
}
