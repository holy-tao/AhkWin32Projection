#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMCameraControl interface controls camera settings such as zoom, pan, aperture adjustment, or shutter speed. To obtain this interface, query the filter that controls the camera.
 * @remarks
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol">PROPSETID_VIDCAP_CAMERACONTROL</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamcameracontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMCameraControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMCameraControl
     * @type {Guid}
     */
    static IID => Guid("{c6e13370-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRange", "Set", "Get"]

    /**
     * The GetRange method gets the range and default value of a specified camera property.
     * @param {Integer} Property Specifies the property to query, as a value from the [CameraControlProperty](/windows/desktop/api/strmif/ne-strmif-cameracontrolproperty) enumeration.
     * @param {Pointer<Integer>} pMin Receives the minimum value of the property.
     * @param {Pointer<Integer>} pMax Receives the maximum value of the property.
     * @param {Pointer<Integer>} pSteppingDelta Receives the step size for the property. The step size is the smallest increment by which the property can change.
     * @param {Pointer<Integer>} pDefault Receives the default value of the property.
     * @param {Pointer<Integer>} pCapsFlags Receives a member of the [CameraControlFlags](/windows/desktop/api/strmif/ne-strmif-cameracontrolflags) enumeration, indicating whether the property is controlled automatically or manually.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcameracontrol-getrange
     */
    GetRange(Property, pMin, pMax, pSteppingDelta, pDefault, pCapsFlags) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagsMarshal := pCapsFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", Property, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagsMarshal, pCapsFlags, "HRESULT")
        return result
    }

    /**
     * The Set method sets a specified property on the camera.
     * @param {Integer} Property Specifies the property to set, as a value from the [CameraControlProperty](/windows/desktop/api/strmif/ne-strmif-cameracontrolproperty) enumeration.
     * @param {Integer} lValue Specifies the new value of the property.
     * @param {Integer} Flags Specifies the desired control setting, as a member of the [CameraControlFlags](/windows/desktop/api/strmif/ne-strmif-cameracontrolflags) enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcameracontrol-set
     */
    Set(Property, lValue, Flags) {
        result := ComCall(4, this, "int", Property, "int", lValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The Get method gets the current setting of a camera property.
     * @param {Integer} Property Specifies the property to retrieve, as a value from the [CameraControlProperty](/windows/desktop/api/strmif/ne-strmif-cameracontrolproperty) enumeration.
     * @param {Pointer<Integer>} lValue Receives the value of the property.
     * @param {Pointer<Integer>} Flags Receives a member of the [CameraControlFlags](/windows/desktop/api/strmif/ne-strmif-cameracontrolflags) enumeration. The returned value indicates whether the setting is controlled manually or automatically.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcameracontrol-get
     */
    Get(Property, lValue, Flags) {
        lValueMarshal := lValue is VarRef ? "int*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", Property, lValueMarshal, lValue, FlagsMarshal, Flags, "HRESULT")
        return result
    }
}
