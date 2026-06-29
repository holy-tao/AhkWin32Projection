#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRSurface interface is implemented on the media samples used by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrsurface
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurface extends IUnknown {
    /**
     * The interface identifier for IVMRSurface
     * @type {Guid}
     */
    static IID := Guid("{a9849bbe-9ec8-4263-b764-62730f0d15d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurface interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsSurfaceLocked : IntPtr
        LockSurface     : IntPtr
        UnlockSurface   : IntPtr
        GetSurface      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsSurfaceLocked method indicates whether the DirectDraw surface attached to this media sample is locked.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-issurfacelocked
     */
    IsSurfaceLocked() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The LockSurface method locks the attached DirectDraw surface.
     * @returns {Pointer<Integer>} Address of a variable that receives a pointer to the locked bits.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-locksurface
     */
    LockSurface() {
        result := ComCall(4, this, "ptr*", &lpSurface := 0, "HRESULT")
        return lpSurface
    }

    /**
     * The UnlockSurface method unlocks the attached DirectDraw surface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No DirectDraw surface is attached to this sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-unlocksurface
     */
    UnlockSurface() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetSurface method retrieves the attached DirectDraw surface interface.
     * @returns {IDirectDrawSurface7} Address of a variable that receives a pointer to the <b>IDirectDrawSurface7</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-getsurface
     */
    GetSurface() {
        result := ComCall(6, this, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirectDrawSurface7(lplpSurface)
    }

    Query(iid) {
        if (IVMRSurface.IID.Equals(iid)) {
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
