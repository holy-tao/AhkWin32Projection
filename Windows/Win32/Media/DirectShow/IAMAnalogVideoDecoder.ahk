#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMAnalogVideoDecoder interface sets and retrieves information about the analog-to-digital conversion process in a video capture filter.The WDM Video Capture filter exposes this interface if the device is an analog video capture device.
 * @remarks
 * 
  * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videodecoder">PROPSETID_VIDCAP_VIDEODECODER</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamanalogvideodecoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMAnalogVideoDecoder extends IUnknown{
    /**
     * The interface identifier for IAMAnalogVideoDecoder
     * @type {Guid}
     */
    static IID => Guid("{c6e13350-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} lAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_AvailableTVFormats(lAnalogVideoStandard) {
        result := ComCall(3, this, "int*", lAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_TVFormat(plAnalogVideoStandard) {
        result := ComCall(5, this, "int*", plAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLocked 
     * @returns {HRESULT} 
     */
    get_HorizontalLocked(plLocked) {
        result := ComCall(6, this, "int*", plLocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lVCRHorizontalLocking 
     * @returns {HRESULT} 
     */
    put_VCRHorizontalLocking(lVCRHorizontalLocking) {
        result := ComCall(7, this, "int", lVCRHorizontalLocking, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plVCRHorizontalLocking 
     * @returns {HRESULT} 
     */
    get_VCRHorizontalLocking(plVCRHorizontalLocking) {
        result := ComCall(8, this, "int*", plVCRHorizontalLocking, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plNumberOfLines 
     * @returns {HRESULT} 
     */
    get_NumberOfLines(plNumberOfLines) {
        result := ComCall(9, this, "int*", plNumberOfLines, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lOutputEnable 
     * @returns {HRESULT} 
     */
    put_OutputEnable(lOutputEnable) {
        result := ComCall(10, this, "int", lOutputEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOutputEnable 
     * @returns {HRESULT} 
     */
    get_OutputEnable(plOutputEnable) {
        result := ComCall(11, this, "int*", plOutputEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
