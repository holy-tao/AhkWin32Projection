#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMAnalogVideoDecoder interface sets and retrieves information about the analog-to-digital conversion process in a video capture filter.The WDM Video Capture filter exposes this interface if the device is an analog video capture device.
 * @remarks
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videodecoder">PROPSETID_VIDCAP_VIDEODECODER</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamanalogvideodecoder
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMAnalogVideoDecoder extends IUnknown {
    /**
     * The interface identifier for IAMAnalogVideoDecoder
     * @type {Guid}
     */
    static IID := Guid("{c6e13350-30ac-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMAnalogVideoDecoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_AvailableTVFormats   : IntPtr
        put_TVFormat             : IntPtr
        get_TVFormat             : IntPtr
        get_HorizontalLocked     : IntPtr
        put_VCRHorizontalLocking : IntPtr
        get_VCRHorizontalLocking : IntPtr
        get_NumberOfLines        : IntPtr
        put_OutputEnable         : IntPtr
        get_OutputEnable         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMAnalogVideoDecoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(3, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * The put_TVFormat method sets the analog video format.
     * @param {Integer} lAnalogVideoStandard Specifies the video format as a member of the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-put_tvformat
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * The get_TVFormat method retrieves the current analog video format.
     * @returns {Integer} Pointer to a variable that receives a member of the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration, indicating the analog video format.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(5, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * The get_HorizontalLocked method determines whether the horizontal sync is locked.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_horizontallocked
     */
    get_HorizontalLocked() {
        result := ComCall(6, this, "int*", &plLocked := 0, "HRESULT")
        return plLocked
    }

    /**
     * The put_VCRHorizontalLocking method specifies whether the video is a tape source or a broadcast source.
     * @remarks
     * The timing accuracy of synchronization pulses is typically poorer from a tape source than from a broadcast source. Setting the value to 1 tells the decoder to relax its standards, which leads to a better chance of maintaining sync.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-put_vcrhorizontallocking
     */
    put_VCRHorizontalLocking(lVCRHorizontalLocking) {
        result := ComCall(7, this, "int", lVCRHorizontalLocking, "HRESULT")
        return result
    }

    /**
     * The get_VCRHorizontalLocking method indicates whether the decoder is expecting video from a tape source or a broadcast source.
     * @remarks
     * The timing accuracy of synchronization pulses is typically poorer from a tape source than from a broadcast source. If the returned value is 1, the decoder might relax its sync timing standards.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_vcrhorizontallocking
     */
    get_VCRHorizontalLocking() {
        result := ComCall(8, this, "int*", &plVCRHorizontalLocking := 0, "HRESULT")
        return plVCRHorizontalLocking
    }

    /**
     * The get_NumberOfLInes method retrieves the number of scan lines in the video signal.
     * @returns {Integer} Pointer to a variable that receives the number of scan lines in the video signal. This is generally by 525 lines for NTSC and 625 lines for PAL or SECAM.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_numberoflines
     */
    get_NumberOfLines() {
        result := ComCall(9, this, "int*", &plNumberOfLines := 0, "HRESULT")
        return plNumberOfLines
    }

    /**
     * The put_OutputEnable method enables or disables the video port bus.
     * @remarks
     * This method applies only to devices that use a shared video port bus. If the value is 1, the device will actively drive the video port bus. If the value is zero, the device will be tri-stated.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-put_outputenable
     */
    put_OutputEnable(lOutputEnable) {
        result := ComCall(10, this, "int", lOutputEnable, "HRESULT")
        return result
    }

    /**
     * The get_OutputEnable method determines whether the video port bus is enabled.
     * @remarks
     * This method applies only to devices that use a shared video port bus. If the returned value is 1, the device is actively driving the video port bus. If the value is zero, the device is tri-stated.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideodecoder-get_outputenable
     */
    get_OutputEnable() {
        result := ComCall(11, this, "int*", &plOutputEnable := 0, "HRESULT")
        return plOutputEnable
    }

    Query(iid) {
        if (IAMAnalogVideoDecoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AvailableTVFormats := CallbackCreate(GetMethod(implObj, "get_AvailableTVFormats"), flags, 2)
        this.vtbl.put_TVFormat := CallbackCreate(GetMethod(implObj, "put_TVFormat"), flags, 2)
        this.vtbl.get_TVFormat := CallbackCreate(GetMethod(implObj, "get_TVFormat"), flags, 2)
        this.vtbl.get_HorizontalLocked := CallbackCreate(GetMethod(implObj, "get_HorizontalLocked"), flags, 2)
        this.vtbl.put_VCRHorizontalLocking := CallbackCreate(GetMethod(implObj, "put_VCRHorizontalLocking"), flags, 2)
        this.vtbl.get_VCRHorizontalLocking := CallbackCreate(GetMethod(implObj, "get_VCRHorizontalLocking"), flags, 2)
        this.vtbl.get_NumberOfLines := CallbackCreate(GetMethod(implObj, "get_NumberOfLines"), flags, 2)
        this.vtbl.put_OutputEnable := CallbackCreate(GetMethod(implObj, "put_OutputEnable"), flags, 2)
        this.vtbl.get_OutputEnable := CallbackCreate(GetMethod(implObj, "get_OutputEnable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AvailableTVFormats)
        CallbackFree(this.vtbl.put_TVFormat)
        CallbackFree(this.vtbl.get_TVFormat)
        CallbackFree(this.vtbl.get_HorizontalLocked)
        CallbackFree(this.vtbl.put_VCRHorizontalLocking)
        CallbackFree(this.vtbl.get_VCRHorizontalLocking)
        CallbackFree(this.vtbl.get_NumberOfLines)
        CallbackFree(this.vtbl.put_OutputEnable)
        CallbackFree(this.vtbl.get_OutputEnable)
    }
}
