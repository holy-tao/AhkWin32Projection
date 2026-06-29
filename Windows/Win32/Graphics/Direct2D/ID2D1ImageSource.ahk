#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Image.ahk" { ID2D1Image }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a producer of pixels that can fill an arbitrary 2D plane. (ID2D1ImageSource)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1imagesource
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ImageSource extends ID2D1Image {
    /**
     * The interface identifier for ID2D1ImageSource
     * @type {Guid}
     */
    static IID := Guid("{c9b664e5-74a1-4378-9ac2-eefc37a3f4d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ImageSource interfaces
    */
    struct Vtbl extends ID2D1Image.Vtbl {
        OfferResources      : IntPtr
        TryReclaimResources : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ImageSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows the operating system to free the video memory of resources by discarding their content. (ID2D1ImageSource.OfferResources)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <b>OfferResources</b> returns:
     *             
     * 
     * <ul>
     * <li><b>S_OK</b> if resources were successfully offered
     *               </li>
     * <li><b>E_INVALIDARG</b> if a resource in the array or the priority is invalid
     *               </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesource-offerresources
     */
    OfferResources() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Restores access to resources that were previously offered by calling OfferResources.
     * @remarks
     * After you call <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1imagesource-offerresources">OfferResources</a> to offer one or more resources, 
     * you must call <b>TryReclaimResources</b> before you can use those resources again. 
     * You must check the value in the <b>resourcesDiscarded</b> to determine whether the resource’s content was discarded. 
     * If a resource’s content was discarded while it was offered, its current content is undefined. Therefore, you must overwrite the resource’s content before you use the resource.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Returns with TRUE if the corresponding resource’s content was discarded and is now undefined, or FALSE if the corresponding resource’s old content is still intact.
     *             The caller can pass in NULL, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesource-tryreclaimresources
     */
    TryReclaimResources() {
        result := ComCall(5, this, BOOL.Ptr, &resourcesDiscarded := 0, "HRESULT")
        return resourcesDiscarded
    }

    Query(iid) {
        if (ID2D1ImageSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OfferResources := CallbackCreate(GetMethod(implObj, "OfferResources"), flags, 1)
        this.vtbl.TryReclaimResources := CallbackCreate(GetMethod(implObj, "TryReclaimResources"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OfferResources)
        CallbackFree(this.vtbl.TryReclaimResources)
    }
}
