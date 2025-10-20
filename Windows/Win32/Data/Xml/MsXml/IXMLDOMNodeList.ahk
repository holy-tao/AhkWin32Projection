#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMNodeList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMNodeList
     * @type {Guid}
     */
    static IID => Guid("{2933bf82-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_item", "get_length", "nextNode", "reset", "get__newEnum"]

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXMLDOMNode>} listItem 
     * @returns {HRESULT} 
     */
    get_item(index, listItem) {
        result := ComCall(7, this, "int", index, "ptr*", listItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} listLength 
     * @returns {HRESULT} 
     */
    get_length(listLength) {
        result := ComCall(8, this, "int*", listLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} nextItem 
     * @returns {HRESULT} 
     */
    nextNode(nextItem) {
        result := ComCall(9, this, "ptr*", nextItem, "HRESULT")
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
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppUnk) {
        result := ComCall(11, this, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
