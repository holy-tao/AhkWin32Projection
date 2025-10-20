#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMRemoteDictionaryResource interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMRemoteDictionaryResourceCollection extends IUnknown{
    /**
     * The interface identifier for IXpsOMRemoteDictionaryResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{5c38db61-7fec-464a-87bd-41e3bef018be}")

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
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} object 
     * @returns {HRESULT} 
     */
    GetAt(index, object) {
        result := ComCall(4, this, "uint", index, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} object 
     * @returns {HRESULT} 
     */
    InsertAt(index, object) {
        result := ComCall(5, this, "uint", index, "ptr", object, "int")
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
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} object 
     * @returns {HRESULT} 
     */
    SetAt(index, object) {
        result := ComCall(7, this, "uint", index, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} object 
     * @returns {HRESULT} 
     */
    Append(object) {
        result := ComCall(8, this, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     */
    GetByPartName(partName, remoteDictionaryResource) {
        result := ComCall(9, this, "ptr", partName, "ptr", remoteDictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
