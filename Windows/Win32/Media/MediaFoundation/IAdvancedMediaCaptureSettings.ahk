#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFDXGIDeviceManager.ahk" { IMFDXGIDeviceManager }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides settings for advanced media capture.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nn-mfmediacapture-iadvancedmediacapturesettings
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IAdvancedMediaCaptureSettings extends IUnknown {
    /**
     * The interface identifier for IAdvancedMediaCaptureSettings
     * @type {Guid}
     */
    static IID := Guid("{24e0485f-a33e-4aa1-b564-6019b1d14f65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAdvancedMediaCaptureSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDirectxDeviceManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAdvancedMediaCaptureSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the DirectX device manager.
     * @returns {IMFDXGIDeviceManager} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nf-mfmediacapture-iadvancedmediacapturesettings-getdirectxdevicemanager
     */
    GetDirectxDeviceManager() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IMFDXGIDeviceManager(value)
    }

    Query(iid) {
        if (IAdvancedMediaCaptureSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDirectxDeviceManager := CallbackCreate(GetMethod(implObj, "GetDirectxDeviceManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDirectxDeviceManager)
    }
}
