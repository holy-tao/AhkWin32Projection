#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to manage a collection of FSRM objects that can have objects added to or removed from the collection.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmmutablecollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmMutableCollection extends IFsrmCollection {
    /**
     * The interface identifier for IFsrmMutableCollection
     * @type {Guid}
     */
    static IID := Guid("{1bb617b8-3886-49dc-af82-a6c90fa35dda}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmMutableCollection interfaces
    */
    struct Vtbl extends IFsrmCollection.Vtbl {
        Add        : IntPtr
        Remove     : IntPtr
        RemoveById : IntPtr
        Clone      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmMutableCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an object to the collection. (IFsrmMutableCollection.Add)
     * @remarks
     * All items in the collection must be of the same type.
     * @param {VARIANT} item A <b>VARIANT</b> that contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface of the object to add to the collection. Set the variant type to <b>VT_DISPATCH</b> and the <b>pdispVal</b> member to the <b>IDispatch</b> interface of the object.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmmutablecollection-add
     */
    Add(item) {
        result := ComCall(14, this, VARIANT, item, "HRESULT")
        return result
    }

    /**
     * Removes the specified object from the collection using an index value.
     * @param {Integer} index One-based index of the item to remove from the collection.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmmutablecollection-remove
     */
    Remove(index) {
        result := ComCall(15, this, "int", index, "HRESULT")
        return result
    }

    /**
     * Removes the specified object from the collection using an object identifier.
     * @param {Guid} id Identifies the object to remove from the collection.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmmutablecollection-removebyid
     */
    RemoveById(id) {
        result := ComCall(16, this, Guid, id, "HRESULT")
        return result
    }

    /**
     * Creates a duplicate IFsrmMutableCollection collection.
     * @returns {IFsrmMutableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmmutablecollection">IFsrmMutableCollection</a> interface to a collection that is a duplicate of this collection.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmmutablecollection-clone
     */
    Clone() {
        result := ComCall(17, this, "ptr*", &collection := 0, "HRESULT")
        return IFsrmMutableCollection(collection)
    }

    Query(iid) {
        if (IFsrmMutableCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveById := CallbackCreate(GetMethod(implObj, "RemoveById"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveById)
        CallbackFree(this.vtbl.Clone)
    }
}
