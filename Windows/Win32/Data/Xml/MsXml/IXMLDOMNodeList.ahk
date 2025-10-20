#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMNodeList extends IDispatch{
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
     * 
     * @param {Integer} index 
     * @param {Pointer<IXMLDOMNode>} listItem 
     * @returns {HRESULT} 
     */
    get_item(index, listItem) {
        result := ComCall(7, this, "int", index, "ptr", listItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} listLength 
     * @returns {HRESULT} 
     */
    get_length(listLength) {
        result := ComCall(8, this, "int*", listLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} nextItem 
     * @returns {HRESULT} 
     */
    nextNode(nextItem) {
        result := ComCall(9, this, "ptr", nextItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppUnk) {
        result := ComCall(11, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
