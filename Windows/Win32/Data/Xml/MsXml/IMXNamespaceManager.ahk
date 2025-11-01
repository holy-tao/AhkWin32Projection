#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXNamespaceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXNamespaceManager
     * @type {Guid}
     */
    static IID => Guid("{c90352f6-643c-4fbc-bb23-e996eb2d51fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putAllowOverride", "getAllowOverride", "reset", "pushContext", "pushNodeContext", "popContext", "declarePrefix", "getDeclaredPrefix", "getPrefix", "getURI"]

    /**
     * 
     * @param {VARIANT_BOOL} fOverride 
     * @returns {HRESULT} 
     */
    putAllowOverride(fOverride) {
        result := ComCall(3, this, "short", fOverride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fOverride 
     * @returns {HRESULT} 
     */
    getAllowOverride(fOverride) {
        result := ComCall(4, this, "ptr", fOverride, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pushContext() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} contextNode 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {HRESULT} 
     */
    pushNodeContext(contextNode, fDeep) {
        result := ComCall(7, this, "ptr", contextNode, "short", fDeep, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    popContext() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} prefix 
     * @param {PWSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    declarePrefix(prefix, namespaceURI) {
        prefix := prefix is String ? StrPtr(prefix) : prefix
        namespaceURI := namespaceURI is String ? StrPtr(namespaceURI) : namespaceURI

        result := ComCall(9, this, "ptr", prefix, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {PWSTR} pwchPrefix 
     * @param {Pointer<Integer>} pcchPrefix 
     * @returns {HRESULT} 
     */
    getDeclaredPrefix(nIndex, pwchPrefix, pcchPrefix) {
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix

        pcchPrefixMarshal := pcchPrefix is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", nIndex, "ptr", pwchPrefix, pcchPrefixMarshal, pcchPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszNamespaceURI 
     * @param {Integer} nIndex 
     * @param {PWSTR} pwchPrefix 
     * @param {Pointer<Integer>} pcchPrefix 
     * @returns {HRESULT} 
     */
    getPrefix(pwszNamespaceURI, nIndex, pwchPrefix, pcchPrefix) {
        pwszNamespaceURI := pwszNamespaceURI is String ? StrPtr(pwszNamespaceURI) : pwszNamespaceURI
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix

        pcchPrefixMarshal := pcchPrefix is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pwszNamespaceURI, "int", nIndex, "ptr", pwchPrefix, pcchPrefixMarshal, pcchPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchPrefix 
     * @param {IXMLDOMNode} pContextNode 
     * @param {PWSTR} pwchUri 
     * @param {Pointer<Integer>} pcchUri 
     * @returns {HRESULT} 
     */
    getURI(pwchPrefix, pContextNode, pwchUri, pcchUri) {
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri

        pcchUriMarshal := pcchUri is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pwchPrefix, "ptr", pContextNode, "ptr", pwchUri, pcchUriMarshal, pcchUri, "HRESULT")
        return result
    }
}
