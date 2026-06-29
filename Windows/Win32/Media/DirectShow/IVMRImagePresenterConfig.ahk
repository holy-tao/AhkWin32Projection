#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRImagePresenterConfig interface provides methods for setting the rendering preferences on the allocator-presenter used by the Video Mixing Renderer Filter 7 (VMR-7).Applications should not use this interface directly.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrimagepresenterconfig
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRImagePresenterConfig extends IUnknown {
    /**
     * The interface identifier for IVMRImagePresenterConfig
     * @type {Guid}
     */
    static IID := Guid("{9f3a1c85-8555-49ba-935f-be5b5b29d178}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRImagePresenterConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRenderingPrefs : IntPtr
        GetRenderingPrefs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRImagePresenterConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetRenderingPrefs method sets the rendering preferences on the VMR-7 filter's allocator-presenter.
     * @param {Integer} dwRenderFlags A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> flags that will be used to configure the allocator-presenter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterconfig-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(3, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * The GetRenderingPrefs method retrieves the current rendering preferences from the VMR-7 filter's allocator-presenter.
     * @returns {Integer} Receives a bitwise OR of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> enumeration, indicating the current rendering settings on the allocator-presenter.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterconfig-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(4, this, "uint*", &dwRenderFlags := 0, "HRESULT")
        return dwRenderFlags
    }

    Query(iid) {
        if (IVMRImagePresenterConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRenderingPrefs := CallbackCreate(GetMethod(implObj, "SetRenderingPrefs"), flags, 2)
        this.vtbl.GetRenderingPrefs := CallbackCreate(GetMethod(implObj, "GetRenderingPrefs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRenderingPrefs)
        CallbackFree(this.vtbl.GetRenderingPrefs)
    }
}
