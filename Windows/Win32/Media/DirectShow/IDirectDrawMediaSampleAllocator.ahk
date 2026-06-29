#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\DirectDraw\IDirectDraw.ahk" { IDirectDraw }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirectDrawMediaSampleAllocator interface allocates samples that contain DirectDraw surfaces.The Overlay Mixer filter's input pin creates an allocator that implements this interface.
 * @see https://learn.microsoft.com/windows/win32/api/amstream/nn-amstream-idirectdrawmediasampleallocator
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDirectDrawMediaSampleAllocator extends IUnknown {
    /**
     * The interface identifier for IDirectDrawMediaSampleAllocator
     * @type {Guid}
     */
    static IID := Guid("{ab6b4afc-f6e4-11d0-900d-00c04fd9189d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawMediaSampleAllocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDirectDraw : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawMediaSampleAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDirectDraw method retrieves a pointer to the DirectDraw instance used to allocate surfaces.
     * @remarks
     * The caller should release the returned <b>IDirectDraw</b> pointer, except when calling the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter's implementation of this interface.
     * @returns {IDirectDraw} Address of a pointer that receives the DirectDraw object's <b>IDirectDraw</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-idirectdrawmediasampleallocator-getdirectdraw
     */
    GetDirectDraw() {
        result := ComCall(3, this, "ptr*", &ppDirectDraw := 0, "HRESULT")
        return IDirectDraw(ppDirectDraw)
    }

    Query(iid) {
        if (IDirectDrawMediaSampleAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDirectDraw := CallbackCreate(GetMethod(implObj, "GetDirectDraw"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDirectDraw)
    }
}
