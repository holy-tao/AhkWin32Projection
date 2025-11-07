#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoControl interface controls certain video capture operations such as enumerating available frame rates and image orientation.
 * @remarks
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videocontrol">PROPSETID_VIDCAP_VIDEOCONTROL</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamvideocontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoControl
     * @type {Guid}
     */
    static IID => Guid("{6a2e0670-28e4-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "SetMode", "GetMode", "GetCurrentActualFrameRate", "GetMaxAvailableFrameRate", "GetFrameRateList"]

    /**
     * 
     * @param {IPin} pPin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getcaps
     */
    GetCaps(pPin) {
        result := ComCall(3, this, "ptr", pPin, "int*", &pCapsFlags := 0, "HRESULT")
        return pCapsFlags
    }

    /**
     * 
     * @param {IPin} pPin 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-setmode
     */
    SetMode(pPin, Mode) {
        result := ComCall(4, this, "ptr", pPin, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} pPin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getmode
     */
    GetMode(pPin) {
        result := ComCall(5, this, "ptr", pPin, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * 
     * @param {IPin} pPin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getcurrentactualframerate
     */
    GetCurrentActualFrameRate(pPin) {
        result := ComCall(6, this, "ptr", pPin, "int64*", &ActualFrameRate := 0, "HRESULT")
        return ActualFrameRate
    }

    /**
     * 
     * @param {IPin} pPin 
     * @param {Integer} iIndex 
     * @param {SIZE} Dimensions 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getmaxavailableframerate
     */
    GetMaxAvailableFrameRate(pPin, iIndex, Dimensions) {
        result := ComCall(7, this, "ptr", pPin, "int", iIndex, "ptr", Dimensions, "int64*", &MaxAvailableFrameRate := 0, "HRESULT")
        return MaxAvailableFrameRate
    }

    /**
     * 
     * @param {IPin} pPin 
     * @param {Integer} iIndex 
     * @param {SIZE} Dimensions 
     * @param {Pointer<Integer>} ListSize 
     * @param {Pointer<Pointer<Integer>>} FrameRates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getframeratelist
     */
    GetFrameRateList(pPin, iIndex, Dimensions, ListSize, FrameRates) {
        ListSizeMarshal := ListSize is VarRef ? "int*" : "ptr"
        FrameRatesMarshal := FrameRates is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pPin, "int", iIndex, "ptr", Dimensions, ListSizeMarshal, ListSize, FrameRatesMarshal, FrameRates, "HRESULT")
        return result
    }
}
