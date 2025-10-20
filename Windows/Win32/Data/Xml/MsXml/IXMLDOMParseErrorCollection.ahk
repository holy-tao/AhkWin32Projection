#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMParseErrorCollection extends IDispatch{
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
     * 
     * @param {Integer} index 
     * @param {Pointer<IXMLDOMParseError2>} error 
     * @returns {HRESULT} 
     */
    get_item(index, error) {
        result := ComCall(7, this, "int", index, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        result := ComCall(8, this, "int*", length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMParseError2>} error 
     * @returns {HRESULT} 
     */
    get_next(error) {
        result := ComCall(9, this, "ptr", error, "int")
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
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppunk) {
        result := ComCall(11, this, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
