#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFDXGIDeviceManager.ahk" { IMFDXGIDeviceManager }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides initialization settings for advanced media capture.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nn-mfmediacapture-iadvancedmediacaptureinitializationsettings
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IAdvancedMediaCaptureInitializationSettings extends IUnknown {
    /**
     * The interface identifier for IAdvancedMediaCaptureInitializationSettings
     * @type {Guid}
     */
    static IID := Guid("{3de21209-8ba6-4f2a-a577-2819b56ff14d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAdvancedMediaCaptureInitializationSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDirectxDeviceManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAdvancedMediaCaptureInitializationSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the DirectX Device Manager.
     * @param {IMFDXGIDeviceManager} value 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nf-mfmediacapture-iadvancedmediacaptureinitializationsettings-setdirectxdevicemanager
     */
    SetDirectxDeviceManager(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAdvancedMediaCaptureInitializationSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDirectxDeviceManager := CallbackCreate(GetMethod(implObj, "SetDirectxDeviceManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDirectxDeviceManager)
    }
}
