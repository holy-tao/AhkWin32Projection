#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxBundleManifestOptionalBundleInfo.ahk" { IAppxBundleManifestOptionalBundleInfo }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the optional bundle information from a bundle.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestOptionalBundleInfoEnumerator extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestOptionalBundleInfoEnumerator
     * @type {Guid}
     */
    static IID := Guid("{9a178793-f97e-46ac-aaca-dd5ba4c177c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestOptionalBundleInfoEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrent    : IntPtr
        GetHasCurrent : IntPtr
        MoveNext      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestOptionalBundleInfoEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the optional bundle information at the current position of the enumerator.
     * @returns {IAppxBundleManifestOptionalBundleInfo} The optional bundle information.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &optionalBundle := 0, "HRESULT")
        return IAppxBundleManifestOptionalBundleInfo(optionalBundle)
    }

    /**
     * Determines whether there is optional bundle information at the current position of the enumerator.
     * @returns {BOOL} <b>TRUE</b> if the enumerator's current position references an item; <b>FALSE</b> if the enumerator has passed the last item in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator-gethascurrent
     */
    GetHasCurrent() {
        result := ComCall(4, this, BOOL.Ptr, &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    /**
     * Advances the position of the enumerator to the next set of optional bundle information.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator successfully advances
     * 
     * <b>FALSE</b> if the enumerator has passed the end of the collection.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestoptionalbundleinfoenumerator-movenext
     */
    MoveNext() {
        result := ComCall(5, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    Query(iid) {
        if (IAppxBundleManifestOptionalBundleInfoEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrent := CallbackCreate(GetMethod(implObj, "GetCurrent"), flags, 2)
        this.vtbl.GetHasCurrent := CallbackCreate(GetMethod(implObj, "GetHasCurrent"), flags, 2)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrent)
        CallbackFree(this.vtbl.GetHasCurrent)
        CallbackFree(this.vtbl.MoveNext)
    }
}
