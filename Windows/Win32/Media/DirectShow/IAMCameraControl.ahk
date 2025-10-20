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
     * 
     * @param {Integer} Property 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcameracontrol-getrange
     */
    GetRange(Property, pMin, pMax, pSteppingDelta, pDefault, pCapsFlags) {
        result := ComCall(3, this, "int", Property, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Property 
     * @param {Integer} lValue 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcameracontrol-set
     */
    Set(Property, lValue, Flags) {
        result := ComCall(4, this, "int", Property, "int", lValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Property 
     * @param {Pointer<Integer>} lValue 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcameracontrol-get
     */
    Get(Property, lValue, Flags) {
        result := ComCall(5, this, "int", Property, "int*", lValue, "int*", Flags, "HRESULT")
        return result
    }
}
