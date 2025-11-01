#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is a collection of namespaces and types used in a WSDAPI stack.
 * @remarks
 * 
  * This interface is used by the XML parser and generator to store and access namespaces, names, and message schema information. Applications can call <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nf-wsdxml-iwsdxmlcontext-addnamespace">AddNamespace</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nf-wsdxml-iwsdxmlcontext-addnametonamespace">AddNameToNamespace</a> directly to add and access names in new or existing namespaces. Additionally, <a href="https://docs.microsoft.com/windows/desktop/WsdApi/web-services-for-devices-code-generator">generated code</a> will call <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nf-wsdxml-iwsdxmlcontext-setnamespaces">SetNamespaces</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/nf-wsdxml-iwsdxmlcontext-settypes">SetTypes</a> to ensure service layer data is properly set up in the XML context.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nn-wsdxml-iwsdxmlcontext
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDXMLContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDXMLContext
     * @type {Guid}
     */
    static IID => Guid("{75d8f3ee-3e5a-43b4-a15a-bcf6887460c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddNamespace", "AddNameToNamespace", "SetNamespaces", "SetTypes"]

    /**
     * 
     * @param {PWSTR} pszUri 
     * @param {PWSTR} pszSuggestedPrefix 
     * @param {Pointer<Pointer<WSDXML_NAMESPACE>>} ppNamespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdxml/nf-wsdxml-iwsdxmlcontext-addnamespace
     */
    AddNamespace(pszUri, pszSuggestedPrefix, ppNamespace) {
        pszUri := pszUri is String ? StrPtr(pszUri) : pszUri
        pszSuggestedPrefix := pszSuggestedPrefix is String ? StrPtr(pszSuggestedPrefix) : pszSuggestedPrefix

        result := ComCall(3, this, "ptr", pszUri, "ptr", pszSuggestedPrefix, "ptr*", ppNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszUri 
     * @param {PWSTR} pszName 
     * @param {Pointer<Pointer<WSDXML_NAME>>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdxml/nf-wsdxml-iwsdxmlcontext-addnametonamespace
     */
    AddNameToNamespace(pszUri, pszName, ppName) {
        pszUri := pszUri is String ? StrPtr(pszUri) : pszUri
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszUri, "ptr", pszName, "ptr*", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSDXML_NAMESPACE>>} pNamespaces 
     * @param {Integer} wNamespacesCount 
     * @param {Integer} bLayerNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdxml/nf-wsdxml-iwsdxmlcontext-setnamespaces
     */
    SetNamespaces(pNamespaces, wNamespacesCount, bLayerNumber) {
        result := ComCall(5, this, "ptr*", pNamespaces, "ushort", wNamespacesCount, "char", bLayerNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSDXML_TYPE>>} pTypes 
     * @param {Integer} dwTypesCount 
     * @param {Integer} bLayerNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdxml/nf-wsdxml-iwsdxmlcontext-settypes
     */
    SetTypes(pTypes, dwTypesCount, bLayerNumber) {
        result := ComCall(6, this, "ptr*", pTypes, "uint", dwTypesCount, "char", bLayerNumber, "HRESULT")
        return result
    }
}
