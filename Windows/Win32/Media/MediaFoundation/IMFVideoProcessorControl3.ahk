#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MFVideoSphericalFormat.ahk" { MFVideoSphericalFormat }
#Import ".\MFVideoSphericalProjectionMode.ahk" { MFVideoSphericalProjectionMode }
#Import ".\IMFVideoProcessorControl2.ahk" { IMFVideoProcessorControl2 }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoProcessorControl3 extends IMFVideoProcessorControl2 {
    /**
     * The interface identifier for IMFVideoProcessorControl3
     * @type {Guid}
     */
    static IID := Guid("{2424b3f2-eb23-40f1-91aa-74bddeea0883}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoProcessorControl3 interfaces
    */
    struct Vtbl extends IMFVideoProcessorControl2.Vtbl {
        GetNaturalOutputType           : IntPtr
        EnableSphericalVideoProcessing : IntPtr
        SetSphericalVideoProperties    : IntPtr
        SetOutputDevice                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoProcessorControl3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMFMediaType} 
     */
    GetNaturalOutputType() {
        result := ComCall(12, this, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @param {MFVideoSphericalFormat} eFormat 
     * @param {MFVideoSphericalProjectionMode} eProjectionMode 
     * @returns {HRESULT} 
     */
    EnableSphericalVideoProcessing(fEnable, eFormat, eProjectionMode) {
        result := ComCall(13, this, BOOL, fEnable, MFVideoSphericalFormat, eFormat, MFVideoSphericalProjectionMode, eProjectionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} X 
     * @param {Float} Y 
     * @param {Float} Z 
     * @param {Float} W 
     * @param {Float} fieldOfView 
     * @returns {HRESULT} 
     */
    SetSphericalVideoProperties(X, Y, Z, W, fieldOfView) {
        result := ComCall(14, this, "float", X, "float", Y, "float", Z, "float", W, "float", fieldOfView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pOutputDevice 
     * @returns {HRESULT} 
     */
    SetOutputDevice(pOutputDevice) {
        result := ComCall(15, this, "ptr", pOutputDevice, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoProcessorControl3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNaturalOutputType := CallbackCreate(GetMethod(implObj, "GetNaturalOutputType"), flags, 2)
        this.vtbl.EnableSphericalVideoProcessing := CallbackCreate(GetMethod(implObj, "EnableSphericalVideoProcessing"), flags, 4)
        this.vtbl.SetSphericalVideoProperties := CallbackCreate(GetMethod(implObj, "SetSphericalVideoProperties"), flags, 6)
        this.vtbl.SetOutputDevice := CallbackCreate(GetMethod(implObj, "SetOutputDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNaturalOutputType)
        CallbackFree(this.vtbl.EnableSphericalVideoProcessing)
        CallbackFree(this.vtbl.SetSphericalVideoProperties)
        CallbackFree(this.vtbl.SetOutputDevice)
    }
}
