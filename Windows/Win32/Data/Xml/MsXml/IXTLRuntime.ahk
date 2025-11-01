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
     * @param {Pointer<Integer>} pID 
     * @returns {HRESULT} 
     */
    uniqueID(pNode, pID) {
        result := ComCall(43, this, "ptr", pNode, "int*", pID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @param {Pointer<Integer>} pDepth 
     * @returns {HRESULT} 
     */
    depth(pNode, pDepth) {
        result := ComCall(44, this, "ptr", pNode, "int*", pDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @param {Pointer<Integer>} pNumber 
     * @returns {HRESULT} 
     */
    childNumber(pNode, pNumber) {
        result := ComCall(45, this, "ptr", pNode, "int*", pNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNodeName 
     * @param {IXMLDOMNode} pNode 
     * @param {Pointer<Integer>} pNumber 
     * @returns {HRESULT} 
     */
    ancestorChildNumber(bstrNodeName, pNode, pNumber) {
        bstrNodeName := bstrNodeName is String ? BSTR.Alloc(bstrNodeName).Value : bstrNodeName

        result := ComCall(46, this, "ptr", bstrNodeName, "ptr", pNode, "int*", pNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @param {Pointer<Integer>} pNumber 
     * @returns {HRESULT} 
     */
    absoluteChildNumber(pNode, pNumber) {
        result := ComCall(47, this, "ptr", pNode, "int*", pNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {BSTR} bstrFormat 
     * @param {Pointer<BSTR>} pbstrFormattedString 
     * @returns {HRESULT} 
     */
    formatIndex(lIndex, bstrFormat, pbstrFormattedString) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        result := ComCall(48, this, "int", lIndex, "ptr", bstrFormat, "ptr", pbstrFormattedString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dblNumber 
     * @param {BSTR} bstrFormat 
     * @param {Pointer<BSTR>} pbstrFormattedString 
     * @returns {HRESULT} 
     */
    formatNumber(dblNumber, bstrFormat, pbstrFormattedString) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        result := ComCall(49, this, "double", dblNumber, "ptr", bstrFormat, "ptr", pbstrFormattedString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varDate 
     * @param {BSTR} bstrFormat 
     * @param {VARIANT} varDestLocale 
     * @param {Pointer<BSTR>} pbstrFormattedString 
     * @returns {HRESULT} 
     */
    formatDate(varDate, bstrFormat, varDestLocale, pbstrFormattedString) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        result := ComCall(50, this, "ptr", varDate, "ptr", bstrFormat, "ptr", varDestLocale, "ptr", pbstrFormattedString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varTime 
     * @param {BSTR} bstrFormat 
     * @param {VARIANT} varDestLocale 
     * @param {Pointer<BSTR>} pbstrFormattedString 
     * @returns {HRESULT} 
     */
    formatTime(varTime, bstrFormat, varDestLocale, pbstrFormattedString) {
        bstrFormat := bstrFormat is String ? BSTR.Alloc(bstrFormat).Value : bstrFormat

        result := ComCall(51, this, "ptr", varTime, "ptr", bstrFormat, "ptr", varDestLocale, "ptr", pbstrFormattedString, "HRESULT")
        return result
    }
}
