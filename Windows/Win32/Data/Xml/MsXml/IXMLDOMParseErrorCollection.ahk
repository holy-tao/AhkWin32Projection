#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMParseError2.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMParseErrorCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMParseErrorCollection
     * @type {Guid}
     */
    static IID => Guid("{3efaa429-272f-11d2-836f-0000f87a7782}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_item", "get_length", "get_next", "reset", "get__newEnum"]

    /**
     * 
     * @param {Integer} index 
     * @returns {IXMLDOMParseError2} 
     */
    get_item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &error := 0, "HRESULT")
        return IXMLDOMParseError2(error)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(8, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {IXMLDOMParseError2} 
     */
    get_next() {
        result := ComCall(9, this, "ptr*", &error := 0, "HRESULT")
        return IXMLDOMParseError2(error)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
