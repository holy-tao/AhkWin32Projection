#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRSurface9 interface is implemented on the media samples used by the Video Mixing Renderer Filter 9.
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrsurface9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurface9 extends IUnknown {
    /**
     * The interface identifier for IVMRSurface9
     * @type {Guid}
     */
    static IID := Guid("{dfc581a1-6e1f-4c3a-8d0a-5e9792ea2afc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurface9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsSurfaceLocked : IntPtr
        LockSurface     : IntPtr
        UnlockSurface   : IntPtr
        GetSurface      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurface9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsSurfaceLocked method indicates whether the Direct3D surface attached to this media sample is locked.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurface9-issurfacelocked
     */
    IsSurfaceLocked() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The LockSurface method locks the attached Direct3D surface.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {Pointer<Integer>} Address of a variable that receives a pointer to the locked bits.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurface9-locksurface
     */
    LockSurface() {
        result := ComCall(4, this, "ptr*", &lpSurface := 0, "HRESULT")
        return lpSurface
    }

    /**
     * The UnlockSurface method unlocks the attached Direct3D surface.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Direct3D surface is attached to this sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurface9-unlocksurface
     */
    UnlockSurface() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetSurface method retrieves the attached Direct3D surface.
     * @remarks
     * The media sample object increments the reference count on the returned interface. The caller must call Release on the interface.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {IDirect3DSurface9} Address of a variable that receives an <b>IDirect3DSurface9</b> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurface9-getsurface
     */
    GetSurface() {
        result := ComCall(6, this, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }

    Query(iid) {
        if (IVMRSurface9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsSurfaceLocked := CallbackCreate(GetMethod(implObj, "IsSurfaceLocked"), flags, 1)
        this.vtbl.LockSurface := CallbackCreate(GetMethod(implObj, "LockSurface"), flags, 2)
        this.vtbl.UnlockSurface := CallbackCreate(GetMethod(implObj, "UnlockSurface"), flags, 1)
        this.vtbl.GetSurface := CallbackCreate(GetMethod(implObj, "GetSurface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsSurfaceLocked)
        CallbackFree(this.vtbl.LockSurface)
        CallbackFree(this.vtbl.UnlockSurface)
        CallbackFree(this.vtbl.GetSurface)
    }
}
