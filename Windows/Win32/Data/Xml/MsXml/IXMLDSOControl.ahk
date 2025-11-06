#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMDocument.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDSOControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDSOControl
     * @type {Guid}
     */
    static IID => Guid("{310afa62-0575-11d2-9ca9-0060b0ec3d39}")

    /**
     * The class identifier for XMLDSOControl
     * @type {Guid}
     */
    static CLSID => Guid("{550dda30-0541-11d2-9ca9-0060b0ec3d39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XMLDocument", "put_XMLDocument", "get_JavaDSOCompatible", "put_JavaDSOCompatible", "get_readyState"]

    /**
     * 
     * @returns {IXMLDOMDocument} 
     */
    get_XMLDocument() {
        result := ComCall(7, this, "ptr*", &ppDoc := 0, "HRESULT")
        return IXMLDOMDocument(ppDoc)
    }

    /**
     * 
     * @param {IXMLDOMDocument} ppDoc 
     * @returns {HRESULT} 
     */
    put_XMLDocument(ppDoc) {
        result := ComCall(8, this, "ptr", ppDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_JavaDSOCompatible() {
        result := ComCall(9, this, "int*", &fJavaDSOCompatible := 0, "HRESULT")
        return fJavaDSOCompatible
    }

    /**
     * 
     * @param {BOOL} fJavaDSOCompatible 
     * @returns {HRESULT} 
     */
    put_JavaDSOCompatible(fJavaDSOCompatible) {
        result := ComCall(10, this, "int", fJavaDSOCompatible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(11, this, "int*", &state := 0, "HRESULT")
        return state
    }
}
