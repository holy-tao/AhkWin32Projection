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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AvailableTVFormats", "put_TVFormat", "get_TVFormat", "get_HorizontalLocked", "put_VCRHorizontalLocking", "get_VCRHorizontalLocking", "get_NumberOfLines", "put_OutputEnable", "get_OutputEnable"]

    /**
     * 
     * @param {Pointer<Integer>} lAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_availabletvformats
     */
    get_AvailableTVFormats(lAnalogVideoStandard) {
        lAnalogVideoStandardMarshal := lAnalogVideoStandard is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lAnalogVideoStandardMarshal, lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-put_tvformat
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_tvformat
     */
    get_TVFormat(plAnalogVideoStandard) {
        plAnalogVideoStandardMarshal := plAnalogVideoStandard is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plAnalogVideoStandardMarshal, plAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plLocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_horizontallocked
     */
    get_HorizontalLocked(plLocked) {
        plLockedMarshal := plLocked is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plLockedMarshal, plLocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lVCRHorizontalLocking 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-put_vcrhorizontallocking
     */
    put_VCRHorizontalLocking(lVCRHorizontalLocking) {
        result := ComCall(7, this, "int", lVCRHorizontalLocking, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plVCRHorizontalLocking 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_vcrhorizontallocking
     */
    get_VCRHorizontalLocking(plVCRHorizontalLocking) {
        plVCRHorizontalLockingMarshal := plVCRHorizontalLocking is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plVCRHorizontalLockingMarshal, plVCRHorizontalLocking, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plNumberOfLines 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_numberoflines
     */
    get_NumberOfLines(plNumberOfLines) {
        plNumberOfLinesMarshal := plNumberOfLines is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plNumberOfLinesMarshal, plNumberOfLines, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lOutputEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-put_outputenable
     */
    put_OutputEnable(lOutputEnable) {
        result := ComCall(10, this, "int", lOutputEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOutputEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_outputenable
     */
    get_OutputEnable(plOutputEnable) {
        plOutputEnableMarshal := plOutputEnable is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plOutputEnableMarshal, plOutputEnable, "HRESULT")
        return result
    }
}
