#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IOpcPartUri interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomparturicollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPartUriCollection extends IUnknown{
    /**
     * The interface identifier for IXpsOMPartUriCollection
     * @type {Guid}
     */
    static IID => Guid("{57c650d4-067c-4893-8c33-f62a0633730f}")

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
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    GetAt(index, partUri) {
        result := ComCall(4, this, "uint", index, "ptr", partUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    InsertAt(index, partUri) {
        result := ComCall(5, this, "uint", index, "ptr", partUri, "int")
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
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    SetAt(index, partUri) {
        result := ComCall(7, this, "uint", index, "ptr", partUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    Append(partUri) {
        result := ComCall(8, this, "ptr", partUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
