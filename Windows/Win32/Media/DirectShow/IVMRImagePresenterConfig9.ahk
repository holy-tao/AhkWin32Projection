#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRImagePresenterConfig interface provides methods for setting the rendering preferences on the allocator-presenter used by the Video Mixing Renderer Filter 9 (VMR-9).Applications should not use this interface directly.
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrimagepresenterconfig9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRImagePresenterConfig9 extends IUnknown {
    /**
     * The interface identifier for IVMRImagePresenterConfig9
     * @type {Guid}
     */
    static IID := Guid("{45c15cab-6e22-420a-8043-ae1f0ac02c7d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRImagePresenterConfig9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRenderingPrefs : IntPtr
        GetRenderingPrefs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRImagePresenterConfig9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetRenderingPrefs method sets the rendering preferences on the VMR-9 filter's allocator-presenter.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwRenderFlags A bitwise OR combination of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9renderprefs">VMR9RenderPrefs</a> flags that will be used to configure the allocator-presenter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenterconfig9-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(3, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * The GetRenderingPrefs method gets the current rendering preferences from the VMR-9 filter's allocator-presenter.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {Integer} Receives a bitwise OR of flag from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9renderprefs">VMR9RenderPrefs</a> enumeration, indicating the current rendering settings on the allocator-presenter.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenterconfig9-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(4, this, "uint*", &dwRenderFlags := 0, "HRESULT")
        return dwRenderFlags
    }

    Query(iid) {
        if (IVMRImagePresenterConfig9.IID.Equals(iid)) {
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
