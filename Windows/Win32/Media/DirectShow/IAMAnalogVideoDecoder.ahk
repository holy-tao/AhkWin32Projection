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
     * @type {Integer} 
     */
    AvailableTVFormats {
        get => this.get_AvailableTVFormats()
    }

    /**
     * @type {Integer} 
     */
    TVFormat {
        get => this.get_TVFormat()
        set => this.put_TVFormat(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalLocked {
        get => this.get_HorizontalLocked()
    }

    /**
     * @type {Integer} 
     */
    VCRHorizontalLocking {
        get => this.get_VCRHorizontalLocking()
        set => this.put_VCRHorizontalLocking(value)
    }

    /**
     * @type {Integer} 
     */
    NumberOfLines {
        get => this.get_NumberOfLines()
    }

    /**
     * @type {Integer} 
     */
    OutputEnable {
        get => this.get_OutputEnable()
        set => this.put_OutputEnable(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(3, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(5, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_horizontallocked
     */
    get_HorizontalLocked() {
        result := ComCall(6, this, "int*", &plLocked := 0, "HRESULT")
        return plLocked
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_vcrhorizontallocking
     */
    get_VCRHorizontalLocking() {
        result := ComCall(8, this, "int*", &plVCRHorizontalLocking := 0, "HRESULT")
        return plVCRHorizontalLocking
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_numberoflines
     */
    get_NumberOfLines() {
        result := ComCall(9, this, "int*", &plNumberOfLines := 0, "HRESULT")
        return plNumberOfLines
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_outputenable
     */
    get_OutputEnable() {
        result := ComCall(11, this, "int*", &plOutputEnable := 0, "HRESULT")
        return plOutputEnable
    }
}
