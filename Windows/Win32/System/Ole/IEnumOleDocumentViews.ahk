#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOleDocumentView.ahk" { IOleDocumentView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the views supported by a document object.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/nn-docobj-ienumoledocumentviews
 * @namespace Windows.Win32.System.Ole
 */
export default struct IEnumOleDocumentViews extends IUnknown {
    /**
     * The interface identifier for IEnumOleDocumentViews
     * @type {Guid}
     */
    static IID := Guid("{b722bcc8-4e68-101b-a2bc-00aa00404770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumOleDocumentViews interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumOleDocumentViews.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of items in the enumeration sequence. (IEnumOleDocumentViews.Next)
     * @remarks
     * E_NOTIMPL is not allowed as a return value. If an error value is returned, no entries in the <i>rgpView</i> array are valid and no calls to Release are required.
     * @param {Integer} cViews The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * 
     * If <i>pcFetched</i> is <b>NULL</b>, this parameter must be 1.
     * @param {Pointer<IOleDocumentView>} rgpView An array of enumerated items.
     * 
     * The enumerator is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> through each pointer enumerated. If <i>cViews</i> is greater than 1, the caller must also pass a non-<b>NULL</b> pointer passed to <i>pcFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pcFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested. This parameter can be <b>NULL</b>, in which case the <i>cViews</i> parameter must be 1.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-next
     */
    Next(cViews, rgpView, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cViews, IOleDocumentView.Ptr, rgpView, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence. (IEnumOleDocumentViews.Skip)
     * @param {Integer} cViews The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-skip
     */
    Skip(cViews) {
        result := ComCall(4, this, "uint", cViews, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning. (IEnumOleDocumentViews.Reset)
     * @remarks
     * There is no guarantee that the same set of objects will be enumerated after the reset operation has completed. A static collection is reset to the beginning, but it can be too expensive for some collections, such as files in a directory, to guarantee this condition.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current one. (IEnumOleDocumentViews.Clone)
     * @returns {IEnumOleDocumentViews} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ienumoledocumentviews">IEnumOleDocumentViews</a> interface pointer on the newly created enumerator. The caller must release this enumerator separately from the one from which it was cloned.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ienumoledocumentviews-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumOleDocumentViews(ppEnum)
    }

    Query(iid) {
        if (IEnumOleDocumentViews.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
