#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXTLRuntime extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXTLRuntime
     * @type {Guid}
     */
    static IID => Guid("{3efaa425-272f-11d2-836f-0000f87a7782}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["uniqueID", "depth", "childNumber", "ancestorChildNumber", "absoluteChildNumber", "formatIndex", "formatNumber", "formatDate", "formatTime"]

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    uniqueID(pNode) {
        result := ComCall(43, this, "ptr", pNode, "int*", &pID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pID
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    depth(pNode) {
        result := ComCall(44, this, "ptr", pNode, "int*", &pDepth := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDepth
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    childNumber(pNode) {
        result := ComCall(45, this, "ptr", pNode, "int*", &pNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNumber
    }

    /**
     * 
     * @param {BSTR} bstrNodeName 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    ancestorChildNumber(bstrNodeName, pNode) {
        if(bstrNodeName is String) {
            pin := BSTR.Alloc(bstrNodeName)
            bstrNodeName := pin.Value
        }

        result := ComCall(46, this, "ptr", bstrNodeName, "ptr", pNode, "int*", &pNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNumber
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {Integer} 
     */
    absoluteChildNumber(pNode) {
        result := ComCall(47, this, "ptr", pNode, "int*", &pNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pNumber
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {BSTR} bstrFormat 
     * @returns {BSTR} 
     */
    formatIndex(lIndex, bstrFormat) {
        if(bstrFormat is String) {
            pin := BSTR.Alloc(bstrFormat)
            bstrFormat := pin.Value
        }

        pbstrFormattedString := BSTR()
        result := ComCall(48, this, "int", lIndex, "ptr", bstrFormat, "ptr", pbstrFormattedString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFormattedString
    }

    /**
     * 
     * @param {Float} dblNumber 
     * @param {BSTR} bstrFormat 
     * @returns {BSTR} 
     */
    formatNumber(dblNumber, bstrFormat) {
        if(bstrFormat is String) {
            pin := BSTR.Alloc(bstrFormat)
            bstrFormat := pin.Value
        }

        pbstrFormattedString := BSTR()
        result := ComCall(49, this, "double", dblNumber, "ptr", bstrFormat, "ptr", pbstrFormattedString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFormattedString
    }

    /**
     * 
     * @param {VARIANT} varDate 
     * @param {BSTR} bstrFormat 
     * @param {VARIANT} varDestLocale 
     * @returns {BSTR} 
     */
    formatDate(varDate, bstrFormat, varDestLocale) {
        if(bstrFormat is String) {
            pin := BSTR.Alloc(bstrFormat)
            bstrFormat := pin.Value
        }

        pbstrFormattedString := BSTR()
        result := ComCall(50, this, "ptr", varDate, "ptr", bstrFormat, "ptr", varDestLocale, "ptr", pbstrFormattedString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFormattedString
    }

    /**
     * 
     * @param {VARIANT} varTime 
     * @param {BSTR} bstrFormat 
     * @param {VARIANT} varDestLocale 
     * @returns {BSTR} 
     */
    formatTime(varTime, bstrFormat, varDestLocale) {
        if(bstrFormat is String) {
            pin := BSTR.Alloc(bstrFormat)
            bstrFormat := pin.Value
        }

        pbstrFormattedString := BSTR()
        result := ComCall(51, this, "ptr", varTime, "ptr", bstrFormat, "ptr", varDestLocale, "ptr", pbstrFormattedString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrFormattedString
    }
}
