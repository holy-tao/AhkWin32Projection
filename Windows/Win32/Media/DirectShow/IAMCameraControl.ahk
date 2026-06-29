#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMCameraControl interface controls camera settings such as zoom, pan, aperture adjustment, or shutter speed. To obtain this interface, query the filter that controls the camera.
 * @remarks
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol">PROPSETID_VIDCAP_CAMERACONTROL</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamcameracontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMCameraControl extends IUnknown {
    /**
     * The interface identifier for IAMCameraControl
     * @type {Guid}
     */
    static IID := Guid("{c6e13370-30ac-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMCameraControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRange : IntPtr
        Set      : IntPtr
        Get      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMCameraControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetRange method gets the range and default value of a specified camera property.
     * @param {Integer} _Property Specifies the property to query, as a value from the [CameraControlProperty](/windows/desktop/api/strmif/ne-strmif-cameracontrolproperty) enumeration.
     * @param {Pointer<Integer>} pMin Receives the minimum value of the property.
     * @param {Pointer<Integer>} pMax Receives the maximum value of the property.
     * @param {Pointer<Integer>} pSteppingDelta Receives the step size for the property. The step size is the smallest increment by which the property can change.
     * @param {Pointer<Integer>} pDefault Receives the default value of the property.
     * @param {Pointer<Integer>} pCapsFlags Receives a member of the [CameraControlFlags](/windows/desktop/api/strmif/ne-strmif-cameracontrolflags) enumeration, indicating whether the property is controlled automatically or manually.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcameracontrol-getrange
     */
    GetRange(_Property, pMin, pMax, pSteppingDelta, pDefault, pCapsFlags) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagsMarshal := pCapsFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", _Property, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagsMarshal, pCapsFlags, "HRESULT")
        return result
    }

    /**
     * The Set method sets a specified property on the camera.
     * @remarks
     * If the <i>Flags</i> parameter is <b>CameraControl_Flags_Auto</b>, the method ignores the <i>lValue</i> parameter.
     * @param {Integer} _Property Specifies the property to set, as a value from the [CameraControlProperty](/windows/desktop/api/strmif/ne-strmif-cameracontrolproperty) enumeration.
     * @param {Integer} lValue Specifies the new value of the property.
     * @param {Integer} Flags Specifies the desired control setting, as a member of the [CameraControlFlags](/windows/desktop/api/strmif/ne-strmif-cameracontrolflags) enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcameracontrol-set
     */
    Set(_Property, lValue, Flags) {
        result := ComCall(4, this, "int", _Property, "int", lValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The Get method gets the current setting of a camera property.
     * @param {Integer} _Property Specifies the property to retrieve, as a value from the [CameraControlProperty](/windows/desktop/api/strmif/ne-strmif-cameracontrolproperty) enumeration.
     * @param {Pointer<Integer>} lValue Receives the value of the property.
     * @param {Pointer<Integer>} Flags Receives a member of the [CameraControlFlags](/windows/desktop/api/strmif/ne-strmif-cameracontrolflags) enumeration. The returned value indicates whether the setting is controlled manually or automatically.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcameracontrol-get
     */
    Get(_Property, lValue, Flags) {
        lValueMarshal := lValue is VarRef ? "int*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", _Property, lValueMarshal, lValue, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMCameraControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 7)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 4)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRange)
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Get)
    }
}
