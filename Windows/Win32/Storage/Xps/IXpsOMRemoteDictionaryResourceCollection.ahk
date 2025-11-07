#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "InsertAt", "RemoveAt", "SetAt", "Append", "GetByPartName"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXpsOMRemoteDictionaryResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &object := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(object)
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMRemoteDictionaryResource} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-insertat
     */
    InsertAt(index, object) {
        result := ComCall(5, this, "uint", index, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMRemoteDictionaryResource} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-setat
     */
    SetAt(index, object) {
        result := ComCall(7, this, "uint", index, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMRemoteDictionaryResource} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-append
     */
    Append(object) {
        result := ComCall(8, this, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partName 
     * @returns {IXpsOMRemoteDictionaryResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresourcecollection-getbypartname
     */
    GetByPartName(partName) {
        result := ComCall(9, this, "ptr", partName, "ptr*", &remoteDictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(remoteDictionaryResource)
    }
}
