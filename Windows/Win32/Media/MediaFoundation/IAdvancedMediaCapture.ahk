#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAdvancedMediaCaptureSettings.ahk" { IAdvancedMediaCaptureSettings }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables advanced media capture.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nn-mfmediacapture-iadvancedmediacapture
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IAdvancedMediaCapture extends IUnknown {
    /**
     * The interface identifier for IAdvancedMediaCapture
     * @type {Guid}
     */
    static IID := Guid("{d0751585-d216-4344-b5bf-463b68f977bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAdvancedMediaCapture interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAdvancedMediaCaptureSettings : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAdvancedMediaCapture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the advanced media capture settings.
     * @returns {IAdvancedMediaCaptureSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediacapture/nf-mfmediacapture-iadvancedmediacapture-getadvancedmediacapturesettings
     */
    GetAdvancedMediaCaptureSettings() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IAdvancedMediaCaptureSettings(value)
    }

    Query(iid) {
        if (IAdvancedMediaCapture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAdvancedMediaCaptureSettings := CallbackCreate(GetMethod(implObj, "GetAdvancedMediaCaptureSettings"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAdvancedMediaCaptureSettings)
    }
}
