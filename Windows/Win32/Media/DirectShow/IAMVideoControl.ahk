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
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Pointer<Int32>} pCapsFlags 
     * @returns {HRESULT} 
     */
    GetCaps(pPin, pCapsFlags) {
        result := ComCall(3, this, "ptr", pPin, "int*", pCapsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    SetMode(pPin, Mode) {
        result := ComCall(4, this, "ptr", pPin, "int", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Pointer<Int32>} Mode 
     * @returns {HRESULT} 
     */
    GetMode(pPin, Mode) {
        result := ComCall(5, this, "ptr", pPin, "int*", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Pointer<Int64>} ActualFrameRate 
     * @returns {HRESULT} 
     */
    GetCurrentActualFrameRate(pPin, ActualFrameRate) {
        result := ComCall(6, this, "ptr", pPin, "int64*", ActualFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Integer} iIndex 
     * @param {SIZE} Dimensions 
     * @param {Pointer<Int64>} MaxAvailableFrameRate 
     * @returns {HRESULT} 
     */
    GetMaxAvailableFrameRate(pPin, iIndex, Dimensions, MaxAvailableFrameRate) {
        result := ComCall(7, this, "ptr", pPin, "int", iIndex, "ptr", Dimensions, "int64*", MaxAvailableFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Integer} iIndex 
     * @param {SIZE} Dimensions 
     * @param {Pointer<Int32>} ListSize 
     * @param {Pointer<Int64>} FrameRates 
     * @returns {HRESULT} 
     */
    GetFrameRateList(pPin, iIndex, Dimensions, ListSize, FrameRates) {
        result := ComCall(8, this, "ptr", pPin, "int", iIndex, "ptr", Dimensions, "int*", ListSize, "int64*", FrameRates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
