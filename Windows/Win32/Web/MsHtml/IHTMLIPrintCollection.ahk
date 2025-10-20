#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLIPrintCollection extends IDispatch{
    /**
     * The interface identifier for IHTMLIPrintCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f6b5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} p 
     * @returns {HRESULT} 
     */
    get__newEnum(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUnknown>} ppIPrint 
     * @returns {HRESULT} 
     */
    item(index, ppIPrint) {
        result := ComCall(9, this, "int", index, "ptr", ppIPrint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
