#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMXNamespacePrefixes.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
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
     * @type {VARIANT_BOOL} 
     */
    allowOverride {
        get => this.get_allowOverride()
        set => this.put_allowOverride(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fOverride 
     * @returns {HRESULT} 
     */
    put_allowOverride(fOverride) {
        result := ComCall(7, this, "short", fOverride, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_allowOverride() {
        result := ComCall(8, this, "short*", &fOverride := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fOverride
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pushContext() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} contextNode 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {HRESULT} 
     */
    pushNodeContext(contextNode, fDeep) {
        result := ComCall(11, this, "ptr", contextNode, "short", fDeep, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    popContext() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} prefix 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    declarePrefix(prefix, namespaceURI) {
        if(prefix is String) {
            pin := BSTR.Alloc(prefix)
            prefix := pin.Value
        }
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(13, this, "ptr", prefix, "ptr", namespaceURI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMXNamespacePrefixes} 
     */
    getDeclaredPrefixes() {
        result := ComCall(14, this, "ptr*", &prefixes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMXNamespacePrefixes(prefixes)
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {IMXNamespacePrefixes} 
     */
    getPrefixes(namespaceURI) {
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(15, this, "ptr", namespaceURI, "ptr*", &prefixes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMXNamespacePrefixes(prefixes)
    }

    /**
     * 
     * @param {BSTR} prefix 
     * @returns {VARIANT} 
     */
    getURI(prefix) {
        if(prefix is String) {
            pin := BSTR.Alloc(prefix)
            prefix := pin.Value
        }

        uri := VARIANT()
        result := ComCall(16, this, "ptr", prefix, "ptr", uri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return uri
    }

    /**
     * 
     * @param {BSTR} strPrefix 
     * @param {IXMLDOMNode} contextNode 
     * @returns {VARIANT} 
     */
    getURIFromNode(strPrefix, contextNode) {
        if(strPrefix is String) {
            pin := BSTR.Alloc(strPrefix)
            strPrefix := pin.Value
        }

        uri := VARIANT()
        result := ComCall(17, this, "ptr", strPrefix, "ptr", contextNode, "ptr", uri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return uri
    }
}
