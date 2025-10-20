#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBMXNamespaceManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBMXNamespaceManager
     * @type {Guid}
     */
    static IID => Guid("{c90352f5-643c-4fbc-bb23-e996eb2d51fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_allowOverride", "get_allowOverride", "reset", "pushContext", "pushNodeContext", "popContext", "declarePrefix", "getDeclaredPrefixes", "getPrefixes", "getURI", "getURIFromNode"]

    /**
     * 
     * @param {VARIANT_BOOL} fOverride 
     * @returns {HRESULT} 
     */
    put_allowOverride(fOverride) {
        result := ComCall(7, this, "short", fOverride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fOverride 
     * @returns {HRESULT} 
     */
    get_allowOverride(fOverride) {
        result := ComCall(8, this, "ptr", fOverride, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pushContext() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} contextNode 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {HRESULT} 
     */
    pushNodeContext(contextNode, fDeep) {
        result := ComCall(11, this, "ptr", contextNode, "short", fDeep, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    popContext() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} prefix 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    declarePrefix(prefix, namespaceURI) {
        prefix := prefix is String ? BSTR.Alloc(prefix).Value : prefix
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(13, this, "ptr", prefix, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMXNamespacePrefixes>} prefixes 
     * @returns {HRESULT} 
     */
    getDeclaredPrefixes(prefixes) {
        result := ComCall(14, this, "ptr*", prefixes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @param {Pointer<IMXNamespacePrefixes>} prefixes 
     * @returns {HRESULT} 
     */
    getPrefixes(namespaceURI, prefixes) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(15, this, "ptr", namespaceURI, "ptr*", prefixes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} prefix 
     * @param {Pointer<VARIANT>} uri 
     * @returns {HRESULT} 
     */
    getURI(prefix, uri) {
        prefix := prefix is String ? BSTR.Alloc(prefix).Value : prefix

        result := ComCall(16, this, "ptr", prefix, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPrefix 
     * @param {IXMLDOMNode} contextNode 
     * @param {Pointer<VARIANT>} uri 
     * @returns {HRESULT} 
     */
    getURIFromNode(strPrefix, contextNode, uri) {
        strPrefix := strPrefix is String ? BSTR.Alloc(strPrefix).Value : strPrefix

        result := ComCall(17, this, "ptr", strPrefix, "ptr", contextNode, "ptr", uri, "HRESULT")
        return result
    }
}
