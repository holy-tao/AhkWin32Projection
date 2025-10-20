#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUICollection interface is implemented by the Ribbon framework.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuicollection
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUICollection extends IUnknown{
    /**
     * The interface identifier for IUICollection
     * @type {Guid}
     */
    static IID => Guid("{df4f45bf-6f9d-4dd7-9d68-d8f9cd18c4db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUnknown>} item 
     * @returns {HRESULT} 
     */
    GetItem(index, item) {
        result := ComCall(4, this, "uint", index, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} item 
     * @returns {HRESULT} 
     */
    Add(item) {
        result := ComCall(5, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUnknown>} item 
     * @returns {HRESULT} 
     */
    Insert(index, item) {
        result := ComCall(6, this, "uint", index, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveAt(index) {
        result := ComCall(7, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} indexReplaced 
     * @param {Pointer<IUnknown>} itemReplaceWith 
     * @returns {HRESULT} 
     */
    Replace(indexReplaced, itemReplaceWith) {
        result := ComCall(8, this, "uint", indexReplaced, "ptr", itemReplaceWith, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
