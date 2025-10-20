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
     * 
     * @param {VARIANT_BOOL} fOverride 
     * @returns {HRESULT} 
     */
    put_allowOverride(fOverride) {
        result := ComCall(7, this, "short", fOverride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fOverride 
     * @returns {HRESULT} 
     */
    get_allowOverride(fOverride) {
        result := ComCall(8, this, "ptr", fOverride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pushContext() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} contextNode 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {HRESULT} 
     */
    pushNodeContext(contextNode, fDeep) {
        result := ComCall(11, this, "ptr", contextNode, "short", fDeep, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    popContext() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(13, this, "ptr", prefix, "ptr", namespaceURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMXNamespacePrefixes>} prefixes 
     * @returns {HRESULT} 
     */
    getDeclaredPrefixes(prefixes) {
        result := ComCall(14, this, "ptr", prefixes, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(15, this, "ptr", namespaceURI, "ptr", prefixes, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(16, this, "ptr", prefix, "ptr", uri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPrefix 
     * @param {Pointer<IXMLDOMNode>} contextNode 
     * @param {Pointer<VARIANT>} uri 
     * @returns {HRESULT} 
     */
    getURIFromNode(strPrefix, contextNode, uri) {
        strPrefix := strPrefix is String ? BSTR.Alloc(strPrefix).Value : strPrefix

        result := ComCall(17, this, "ptr", strPrefix, "ptr", contextNode, "ptr", uri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
