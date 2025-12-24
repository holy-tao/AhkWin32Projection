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
     * Creates an object that represents a namespace in an XML context.
     * @param {PWSTR} pszUri The URI of the namespace.
     * @param {PWSTR} pszSuggestedPrefix The namespace prefix to use when generating XML. If the namespace already exists, <i>pszSuggestedPrefix</i> will overwrite the prefix currently associated with the namespace. The XML context may assign a different namespace prefix. The prefix assigned by the XML context takes precedence over the suggested prefix. The <b>PreferredPrefix</b> member of the structure pointed to by <i>ppNamespace</i> contains the prefix assigned by the XML context.
     * @returns {Pointer<WSDXML_NAMESPACE>} Pointer to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_namespace">WSDXML_NAMESPACE</a> structure that represents the namespace. You must deallocate <i>ppNamespace</i> by calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>. This parameter is optional.
     * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nf-wsdxml-iwsdxmlcontext-addnamespace
     */
    AddNamespace(pszUri, pszSuggestedPrefix) {
        pszUri := pszUri is String ? StrPtr(pszUri) : pszUri
        pszSuggestedPrefix := pszSuggestedPrefix is String ? StrPtr(pszSuggestedPrefix) : pszSuggestedPrefix

        result := ComCall(3, this, "ptr", pszUri, "ptr", pszSuggestedPrefix, "ptr*", &ppNamespace := 0, "HRESULT")
        return ppNamespace
    }

    /**
     * Creates an object that represents a name in a namespace in an XML context.
     * @param {PWSTR} pszUri The URI of the XML namespace in which this name will be created. If this namespace does not already exist in the XML context, a new namespace structure will be generated automatically.
     * @param {PWSTR} pszName The name to add to the namespace specified by <i>pszUri</i>.
     * @returns {Pointer<WSDXML_NAME>} A <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure for the newly created name. You must deallocate <i>ppName</i> by calling <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a>. This parameter is optional.
     * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nf-wsdxml-iwsdxmlcontext-addnametonamespace
     */
    AddNameToNamespace(pszUri, pszName) {
        pszUri := pszUri is String ? StrPtr(pszUri) : pszUri
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszUri, "ptr", pszName, "ptr*", &ppName := 0, "HRESULT")
        return ppName
    }

    /**
     * Associates custom namespaces with the XML context object.
     * @param {Pointer<Pointer<WSDXML_NAMESPACE>>} pNamespaces An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_namespace">WSDXML_NAMESPACE</a> structures.
     * @param {Integer} wNamespacesCount The number of namespaces in the <i>pNamespaces</i> array.
     * @param {Integer} bLayerNumber The layer number associated with the <a href="https://docs.microsoft.com/windows/desktop/WsdApi/web-services-for-devices-code-generator">generated service code</a>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pNamespaces</i> is <b>NULL</b> or  <i>bLayerNumber</i> is greater than or equal to WSD_XMLCONTEXT_NUM_LAYERS (16).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nf-wsdxml-iwsdxmlcontext-setnamespaces
     */
    SetNamespaces(pNamespaces, wNamespacesCount, bLayerNumber) {
        pNamespacesMarshal := pNamespaces is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pNamespacesMarshal, pNamespaces, "ushort", wNamespacesCount, "char", bLayerNumber, "HRESULT")
        return result
    }

    /**
     * Associates custom message types with the XML context object.
     * @param {Pointer<Pointer<WSDXML_TYPE>>} pTypes An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structures that represent the set of messages for the <a href="https://docs.microsoft.com/windows/desktop/WsdApi/web-services-for-devices-code-generator">generated code</a>.
     * @param {Integer} dwTypesCount The number of types in the <i>pTypes</i> array.
     * @param {Integer} bLayerNumber The layer number associated with the <a href="https://docs.microsoft.com/windows/desktop/WsdApi/web-services-for-devices-code-generator">generated service code</a>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pTypes</i> is <b>NULL</b> or <i>bLayerNumber</i> is greater than or equal to WSD_XMLCONTEXT_NUM_LAYERS (16).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdxml/nf-wsdxml-iwsdxmlcontext-settypes
     */
    SetTypes(pTypes, dwTypesCount, bLayerNumber) {
        pTypesMarshal := pTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pTypesMarshal, pTypes, "uint", dwTypesCount, "char", bLayerNumber, "HRESULT")
        return result
    }
}
