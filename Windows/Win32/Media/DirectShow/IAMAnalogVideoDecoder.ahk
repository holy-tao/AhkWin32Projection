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
     * The get_AvailableTVFormats method retrieves the analog video formats that the decoder supports.
     * @returns {Integer} Pointer to a variable that receives a bitwise [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(3, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * The put_TVFormat method sets the analog video format.
     * @param {Integer} lAnalogVideoStandard Specifies the video format as a member of the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-put_tvformat
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * The get_TVFormat method retrieves the current analog video format.
     * @returns {Integer} Pointer to a variable that receives a member of the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration, indicating the analog video format.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(5, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * The get_HorizontalLocked method determines whether the horizontal sync is locked.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-get_horizontallocked
     */
    get_HorizontalLocked() {
        result := ComCall(6, this, "int*", &plLocked := 0, "HRESULT")
        return plLocked
    }

    /**
     * The put_VCRHorizontalLocking method specifies whether the video is a tape source or a broadcast source.
     * @param {Integer} lVCRHorizontalLocking 
     * @returns {HRESULT} Returns an HRESULT value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PROP_ID_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-put_vcrhorizontallocking
     */
    put_VCRHorizontalLocking(lVCRHorizontalLocking) {
        result := ComCall(7, this, "int", lVCRHorizontalLocking, "HRESULT")
        return result
    }

    /**
     * The get_VCRHorizontalLocking method indicates whether the decoder is expecting video from a tape source or a broadcast source.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-get_vcrhorizontallocking
     */
    get_VCRHorizontalLocking() {
        result := ComCall(8, this, "int*", &plVCRHorizontalLocking := 0, "HRESULT")
        return plVCRHorizontalLocking
    }

    /**
     * The get_NumberOfLInes method retrieves the number of scan lines in the video signal.
     * @returns {Integer} Pointer to a variable that receives the number of scan lines in the video signal. This is generally by 525 lines for NTSC and 625 lines for PAL or SECAM.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-get_numberoflines
     */
    get_NumberOfLines() {
        result := ComCall(9, this, "int*", &plNumberOfLines := 0, "HRESULT")
        return plNumberOfLines
    }

    /**
     * The put_OutputEnable method enables or disables the video port bus.
     * @param {Integer} lOutputEnable 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PROP_ID_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-put_outputenable
     */
    put_OutputEnable(lOutputEnable) {
        result := ComCall(10, this, "int", lOutputEnable, "HRESULT")
        return result
    }

    /**
     * The get_OutputEnable method determines whether the video port bus is enabled.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideodecoder-get_outputenable
     */
    get_OutputEnable() {
        result := ComCall(11, this, "int*", &plOutputEnable := 0, "HRESULT")
        return plOutputEnable
    }
}
