#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IObjectArray.ahk" { IObjectArray }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Extends the IObjectArray interface by providing methods that enable clients to add and remove objects that support IUnknown in a collection.
 * @remarks
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface to interact with a collection of generic objects.
 * @see https://learn.microsoft.com/windows/win32/api/objectarray/nn-objectarray-iobjectcollection
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct IObjectCollection extends IObjectArray {
    /**
     * The interface identifier for IObjectCollection
     * @type {Guid}
     */
    static IID := Guid("{5632b1a4-e38a-400a-928a-d4cd63230295}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectCollection interfaces
    */
    struct Vtbl extends IObjectArray.Vtbl {
        AddObject      : IntPtr
        AddFromArray   : IntPtr
        RemoveObjectAt : IntPtr
        Clear          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a single object to the collection.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the object to be added to the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-addobject
     */
    AddObject(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Adds the objects contained in an IObjectArray to the collection.
     * @param {IObjectArray} poaSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> whose contents are to be added to the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-addfromarray
     */
    AddFromArray(poaSource) {
        result := ComCall(6, this, "ptr", poaSource, "HRESULT")
        return result
    }

    /**
     * Removes a single, specified object from the collection.
     * @param {Integer} uiIndex Type: <b>UINT*</b>
     * 
     * A pointer to the index of the object within the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-removeobjectat
     */
    RemoveObjectAt(uiIndex) {
        result := ComCall(7, this, "uint", uiIndex, "HRESULT")
        return result
    }

    /**
     * Removes all objects from the collection. (IObjectCollection.Clear)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddObject := CallbackCreate(GetMethod(implObj, "AddObject"), flags, 2)
        this.vtbl.AddFromArray := CallbackCreate(GetMethod(implObj, "AddFromArray"), flags, 2)
        this.vtbl.RemoveObjectAt := CallbackCreate(GetMethod(implObj, "RemoveObjectAt"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddObject)
        CallbackFree(this.vtbl.AddFromArray)
        CallbackFree(this.vtbl.RemoveObjectAt)
        CallbackFree(this.vtbl.Clear)
    }
}
