#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPin.ahk" { IPin }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The IAMVideoControl interface controls certain video capture operations such as enumerating available frame rates and image orientation.
 * @remarks
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-videocontrol">PROPSETID_VIDCAP_VIDEOCONTROL</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamvideocontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMVideoControl extends IUnknown {
    /**
     * The interface identifier for IAMVideoControl
     * @type {Guid}
     */
    static IID := Guid("{6a2e0670-28e4-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMVideoControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCaps                   : IntPtr
        SetMode                   : IntPtr
        GetMode                   : IntPtr
        GetCurrentActualFrameRate : IntPtr
        GetMaxAvailableFrameRate  : IntPtr
        GetFrameRateList          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMVideoControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCaps method retrieves the capabilities of the underlying hardware.
     * @remarks
     * Possible capabilities include one or more of the following: flipping the picture horizontally, flipping the picture vertically, enabling external triggers, and simulating external triggers.
     * @param {IPin} pPin Pointer to the pin to query capabilities from.
     * @returns {Integer} Pointer to a value representing a combination of the flags from the [VideoControlFlags](/windows/desktop/api/strmif/ne-strmif-videocontrolflags) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getcaps
     */
    GetCaps(pPin) {
        result := ComCall(3, this, "ptr", pPin, "int*", &pCapsFlags := 0, "HRESULT")
        return pCapsFlags
    }

    /**
     * The SetMode method sets the video control mode of operation.
     * @remarks
     * Possible modes of operation include one or more of the following: flipping the picture horizontally, flipping the picture vertically, enabling external triggers, and simulating external triggers.
     * @param {IPin} pPin Pointer to the pin to set the video control mode on.
     * @param {Integer} _Mode Value specifying a combination of the flags from the [VideoControlFlags](/windows/desktop/api/strmif/ne-strmif-videocontrolflags) enumeration to set the video control mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-setmode
     */
    SetMode(pPin, _Mode) {
        result := ComCall(4, this, "ptr", pPin, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * The GetMode method retrieves the video control mode of operation.
     * @remarks
     * Possible modes of operation include one or more of the following: flipping the picture horizontally, flipping the picture vertically, enabling external triggers, and simulating external triggers.
     * @param {IPin} pPin Pointer to the pin to retrieve the video control mode from.
     * @returns {Integer} Pointer to a value representing a combination of the flags from the [VideoControlFlags](/windows/desktop/api/strmif/ne-strmif-videocontrolflags) enumeration, which specify the video control mode.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getmode
     */
    GetMode(pPin) {
        result := ComCall(5, this, "ptr", pPin, "int*", &_Mode := 0, "HRESULT")
        return _Mode
    }

    /**
     * The GetCurrentActualFrameRate method retrieves the actual frame rate, expressed as a frame duration in 100-nanosecond units.
     * @param {IPin} pPin Pointer to the pin to retrieve the frame rate from.
     * @returns {Integer} Pointer to the frame rate in frame duration in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getcurrentactualframerate
     */
    GetCurrentActualFrameRate(pPin) {
        result := ComCall(6, this, "ptr", pPin, "int64*", &ActualFrameRate := 0, "HRESULT")
        return ActualFrameRate
    }

    /**
     * The GetMaxAvailableFrameRate method retrieves the maximum frame rate currently available, based on bus bandwidth usage for connections, such as USB and IEEE 1394, where the maximum frame rate may be limited by bandwidth availability.
     * @param {IPin} pPin Pointer to the pin to retrieve the maximum frame rate from.
     * @param {Integer} iIndex Index of the format to query for maximum frame rate. This index corresponds to the order in which formats are enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getstreamcaps">IAMStreamConfig::GetStreamCaps</a>. The value must range between zero and the number of supported <b>VIDEO_STREAM_CONFIG_CAPS</b> structures returned by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities">IAMStreamConfig::GetNumberOfCapabilities</a>) minus one.
     * @param {SIZE} Dimensions Frame image size (width and height) in pixels.
     * @returns {Integer} Pointer to the maximum available frame rate. The frame rate is expressed as frame duration in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getmaxavailableframerate
     */
    GetMaxAvailableFrameRate(pPin, iIndex, Dimensions) {
        result := ComCall(7, this, "ptr", pPin, "int", iIndex, SIZE, Dimensions, "int64*", &MaxAvailableFrameRate := 0, "HRESULT")
        return MaxAvailableFrameRate
    }

    /**
     * The GetFrameRateList method retrieves a list of available frame rates.
     * @remarks
     * The caller is responsible for freeing the memory through a call to <b>CoTaskMemFree</b>.
     * @param {IPin} pPin Pointer to the pin to query for the list of frame rates.
     * @param {Integer} iIndex Index of the format to query for frame rates. This index corresponds to the order in which formats are enumerated by [VIDEO_STREAM_CONFIG_CAPS](/windows/desktop/api/strmif/ns-strmif-video_stream_config_caps) structures returned by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities">IAMStreamConfig::GetNumberOfCapabilities</a>) minus one.
     * @param {SIZE} Dimensions Frame image size (width and height) in pixels.
     * @param {Pointer<Integer>} ListSize Pointer to the number of elements in the list of frame rates.
     * @param {Pointer<Pointer<Integer>>} FrameRates Address of a pointer to an array of frame rates in 100-nanosecond units. Can be <b>NULL</b> if you only need <i>ListSize</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideocontrol-getframeratelist
     */
    GetFrameRateList(pPin, iIndex, Dimensions, ListSize, FrameRates) {
        ListSizeMarshal := ListSize is VarRef ? "int*" : "ptr"
        FrameRatesMarshal := FrameRates is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pPin, "int", iIndex, SIZE, Dimensions, ListSizeMarshal, ListSize, FrameRatesMarshal, FrameRates, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMVideoControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 3)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 3)
        this.vtbl.GetMode := CallbackCreate(GetMethod(implObj, "GetMode"), flags, 3)
        this.vtbl.GetCurrentActualFrameRate := CallbackCreate(GetMethod(implObj, "GetCurrentActualFrameRate"), flags, 3)
        this.vtbl.GetMaxAvailableFrameRate := CallbackCreate(GetMethod(implObj, "GetMaxAvailableFrameRate"), flags, 5)
        this.vtbl.GetFrameRateList := CallbackCreate(GetMethod(implObj, "GetFrameRateList"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.SetMode)
        CallbackFree(this.vtbl.GetMode)
        CallbackFree(this.vtbl.GetCurrentActualFrameRate)
        CallbackFree(this.vtbl.GetMaxAvailableFrameRate)
        CallbackFree(this.vtbl.GetFrameRateList)
    }
}
