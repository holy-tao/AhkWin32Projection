#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirectDrawMediaSample interface provides access to DirectDraw surfaces allocated by the Overlay Mixer filter.The allocator for the Overlay Mixer filter creates samples that expose this interface.
 * @see https://learn.microsoft.com/windows/win32/api/amstream/nn-amstream-idirectdrawmediasample
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDirectDrawMediaSample extends IUnknown {
    /**
     * The interface identifier for IDirectDrawMediaSample
     * @type {Guid}
     */
    static IID := Guid("{ab6b4afe-f6e4-11d0-900d-00c04fd9189d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawMediaSample interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSurfaceAndReleaseLock : IntPtr
        LockMediaSamplePointer   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawMediaSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSurfaceAndReleaseLock method retrieves and unlocks the surface that the sample represents.
     * @remarks
     * The caller should release the returned surface pointer, except when calling the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter's implementation of this interface.
     * @param {Pointer<IDirectDrawSurface>} ppDirectDrawSurface Address of a pointer to the sample's <b>IDirectDrawSurface</b> interface.
     * @param {Pointer<RECT>} pRect Pointer to a variable that receives the address of the rectangle defining the part of the surface that the sample represents.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-idirectdrawmediasample-getsurfaceandreleaselock
     */
    GetSurfaceAndReleaseLock(ppDirectDrawSurface, pRect) {
        result := ComCall(3, this, IDirectDrawSurface.Ptr, ppDirectDrawSurface, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * The LockMediaSamplePointer method locks the surface that the sample represents.
     * @remarks
     * Call this method only after calling <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nf-amstream-idirectdrawmediasample-getsurfaceandreleaselock">IDirectDrawMediaSample::GetSurfaceAndReleaseLock</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-idirectdrawmediasample-lockmediasamplepointer
     */
    LockMediaSamplePointer() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawMediaSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSurfaceAndReleaseLock := CallbackCreate(GetMethod(implObj, "GetSurfaceAndReleaseLock"), flags, 3)
        this.vtbl.LockMediaSamplePointer := CallbackCreate(GetMethod(implObj, "LockMediaSamplePointer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSurfaceAndReleaseLock)
        CallbackFree(this.vtbl.LockMediaSamplePointer)
    }
}
