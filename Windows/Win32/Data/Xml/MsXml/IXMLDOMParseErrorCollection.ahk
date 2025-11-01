#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IXMLDOMParseError2>} error 
     * @returns {HRESULT} 
     */
    get_item(index, error) {
        result := ComCall(7, this, "int", index, "ptr*", error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        lengthMarshal := length is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, lengthMarshal, length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMParseError2>} error 
     * @returns {HRESULT} 
     */
    get_next(error) {
        result := ComCall(9, this, "ptr*", error, "HRESULT")
        return result
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
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppunk) {
        result := ComCall(11, this, "ptr*", ppunk, "HRESULT")
        return result
    }
}
