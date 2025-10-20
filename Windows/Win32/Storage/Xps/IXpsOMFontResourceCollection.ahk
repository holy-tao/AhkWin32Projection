#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMFontResource interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMFontResourceCollection extends IUnknown{
    /**
     * The interface identifier for IXpsOMFontResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{70b4a6bb-88d4-4fa8-aaf9-6d9c596fdbad}")

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
     * @param {Pointer<IXpsOMFontResource>} value 
     * @returns {HRESULT} 
     */
    GetAt(index, value) {
        result := ComCall(4, this, "uint", index, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMFontResource>} value 
     * @returns {HRESULT} 
     */
    SetAt(index, value) {
        result := ComCall(5, this, "uint", index, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMFontResource>} value 
     * @returns {HRESULT} 
     */
    InsertAt(index, value) {
        result := ComCall(6, this, "uint", index, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMFontResource>} value 
     * @returns {HRESULT} 
     */
    Append(value) {
        result := ComCall(7, this, "ptr", value, "int")
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
        result := ComCall(8, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @param {Pointer<IXpsOMFontResource>} part 
     * @returns {HRESULT} 
     */
    GetByPartName(partName, part) {
        result := ComCall(9, this, "ptr", partName, "ptr", part, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
