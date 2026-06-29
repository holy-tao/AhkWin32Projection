#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMediaSample2Config interface returns a pointer to a Direct3D surface representing a VRAM capture buffer.
 * @remarks
 * If a display driver supports VRAM capture, the KsProxy filter allocates samples that expose this interface. Downstream filters can use this interface to access the video data in video memory, without requiring the data to be copied into system memory. The display driver must support the Windows Vista Display Driver Model (WDDM).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imediasample2config
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaSample2Config extends IUnknown {
    /**
     * The interface identifier for IMediaSample2Config
     * @type {Guid}
     */
    static IID := Guid("{68961e68-832b-41ea-bc91-63593f3e70e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaSample2Config interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSurface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaSample2Config.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSurface method returns a pointer to the Direct3D surface managed by this media sample.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface of the Direct3D surface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample2config-getsurface
     */
    GetSurface() {
        result := ComCall(3, this, "ptr*", &ppDirect3DSurface9 := 0, "HRESULT")
        return IUnknown(ppDirect3DSurface9)
    }

    Query(iid) {
        if (IMediaSample2Config.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSurface := CallbackCreate(GetMethod(implObj, "GetSurface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSurface)
    }
}
