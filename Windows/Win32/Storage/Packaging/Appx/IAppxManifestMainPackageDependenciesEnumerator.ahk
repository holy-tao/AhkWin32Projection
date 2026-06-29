#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestMainPackageDependency.ahk" { IAppxManifestMainPackageDependency }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates &lt;MainPackageDependency&gt; elements from an app manifest.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestmainpackagedependenciesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestMainPackageDependenciesEnumerator extends IUnknown {
    /**
     * The interface identifier for IAppxManifestMainPackageDependenciesEnumerator
     * @type {Guid}
     */
    static IID := Guid("{a99c4f00-51d2-4f0f-ba46-7ed5255ebdff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestMainPackageDependenciesEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrent    : IntPtr
        GetHasCurrent : IntPtr
        MoveNext      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestMainPackageDependenciesEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the &lt;MainPackageDependency&gt; element at the current position of the enumerator.
     * @returns {IAppxManifestMainPackageDependency} The current &lt;MainPackageDependency&gt; element.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependenciesenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &mainPackageDependency := 0, "HRESULT")
        return IAppxManifestMainPackageDependency(mainPackageDependency)
    }

    /**
     * Determines whether there is a &lt;MainPackageDependency&gt; element at the current position of the enumerator.
     * @returns {BOOL} <b>TRUE</b> if the enumerator's current position references an item; <b>FALSE</b> if the enumerator has passed the last item in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependenciesenumerator-gethascurrent
     */
    GetHasCurrent() {
        result := ComCall(4, this, BOOL.Ptr, &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    /**
     * Advances the position of the enumerator to the next &lt;MainPackageDependency&gt; element.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator successfully advances
     * 
     * <b>FALSE</b> if the enumerator has passed the end of the collection.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependenciesenumerator-movenext
     */
    MoveNext() {
        result := ComCall(5, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    Query(iid) {
        if (IAppxManifestMainPackageDependenciesEnumerator.IID.Equals(iid)) {
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
