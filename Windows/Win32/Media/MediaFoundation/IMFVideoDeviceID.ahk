#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Returns the device identifier supported by a video renderer component.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideodeviceid
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoDeviceID extends IUnknown {
    /**
     * The interface identifier for IMFVideoDeviceID
     * @type {Guid}
     */
    static IID := Guid("{a38d9567-5a9c-4f3c-b293-8eb415b279ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoDeviceID interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoDeviceID.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the identifier of the video device supported by an EVR mixer or presenter.
     * @remarks
     * If a mixer or presenter uses Direct3D 9, it must return the value IID_IDirect3DDevice9 in <i>pDeviceID</i>. The EVR's default mixer and presenter both return this value. If you write a custom mixer or presenter, it can return some other value. However, the mixer and presenter must use matching device identifiers.
     * @returns {Guid} Receives the device identifier. Generally, the value is IID_IDirect3DDevice9.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideodeviceid-getdeviceid
     */
    GetDeviceID() {
        pDeviceID := Guid()
        result := ComCall(3, this, Guid.Ptr, pDeviceID, "HRESULT")
        return pDeviceID
    }

    Query(iid) {
        if (IMFVideoDeviceID.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceID := CallbackCreate(GetMethod(implObj, "GetDeviceID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceID)
    }
}
