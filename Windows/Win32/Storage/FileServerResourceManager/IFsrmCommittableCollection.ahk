#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FsrmCommitOptions.ahk" { FsrmCommitOptions }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import ".\IFsrmMutableCollection.ahk" { IFsrmMutableCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Defines a collection of FSRM objects that can have the same type of objects added to or removed from the collection. All objects in the collection can also be committed in a single batch operation.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmcommittablecollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmCommittableCollection extends IFsrmMutableCollection {
    /**
     * The interface identifier for IFsrmCommittableCollection
     * @type {Guid}
     */
    static IID := Guid("{96deb3b5-8b91-4a2a-9d93-80a35d8aa847}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmCommittableCollection interfaces
    */
    struct Vtbl extends IFsrmMutableCollection.Vtbl {
        Commit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmCommittableCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Commits all the objects of the collection and returns the commit results for each object.
     * @remarks
     * Committing objects in a batch operation provides better performance than committing each object in the 
     *     collection individually (for example, calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmFileScreen::Commit</a> method).
     * 
     * Note that the state of the objects in the collection must be the same. For example, the collection must 
     *     contain all new objects, objects marked for deletion, or modified objects. The modified category covers objects 
     *     are not new or marked for deletion—it does not necessarily mean that they've been 
     *     modified.
     * 
     * A collection of imported objects would be considered a collection of modified objects. If you marked one or 
     *     more of the imported objects for deletion (called the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-delete">Delete</a> method on the object), you would first have to 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmmutablecollection-remove">remove</a> those objects from the collection before 
     *     committing the rest.
     * @param {FsrmCommitOptions} options One or more options to use when committing the collection of objects. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmcommitoptions">FsrmCommitOptions</a> enumeration.
     * @returns {IFsrmCollection} A collection of <b>HRESULT</b> values that correspond directly to the objects in the 
     *        collection. The <b>HRESULT</b> value indicates the success or failure of committing the 
     *        object.
     * 
     * If the method returns <b>FSRM_S_PARTIAL_BATCH</b> or 
     *        <b>FSRM_E_FAIL_BATCH</b>, check the results.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcommittablecollection-commit
     */
    Commit(options) {
        result := ComCall(18, this, FsrmCommitOptions, options, "ptr*", &results := 0, "HRESULT")
        return IFsrmCollection(results)
    }

    Query(iid) {
        if (IFsrmCommittableCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Commit)
    }
}
