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
     * The GetCaps method retrieves the capabilities of the underlying hardware.
     * @param {IPin} pPin Pointer to the pin to query capabilities from.
     * @returns {Integer} Pointer to a value representing a combination of the flags from the [VideoControlFlags](/windows/desktop/api/strmif/ne-strmif-videocontrolflags) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocontrol-getcaps
     */
    GetCaps(pPin) {
        result := ComCall(3, this, "ptr", pPin, "int*", &pCapsFlags := 0, "HRESULT")
        return pCapsFlags
    }

    /**
     * The SetMode method sets the video control mode of operation.
     * @param {IPin} pPin Pointer to the pin to set the video control mode on.
     * @param {Integer} Mode Value specifying a combination of the flags from the [VideoControlFlags](/windows/desktop/api/strmif/ne-strmif-videocontrolflags) enumeration to set the video control mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocontrol-setmode
     */
    SetMode(pPin, Mode) {
        result := ComCall(4, this, "ptr", pPin, "int", Mode, "HRESULT")
        return result
    }

    /**
     * The GetMode method retrieves the video control mode of operation.
     * @param {IPin} pPin Pointer to the pin to retrieve the video control mode from.
     * @returns {Integer} Pointer to a value representing a combination of the flags from the [VideoControlFlags](/windows/desktop/api/strmif/ne-strmif-videocontrolflags) enumeration, which specify the video control mode.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocontrol-getmode
     */
    GetMode(pPin) {
        result := ComCall(5, this, "ptr", pPin, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * The GetCurrentActualFrameRate method retrieves the actual frame rate, expressed as a frame duration in 100-nanosecond units.
     * @param {IPin} pPin Pointer to the pin to retrieve the frame rate from.
     * @returns {Integer} Pointer to the frame rate in frame duration in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocontrol-getcurrentactualframerate
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocontrol-getmaxavailableframerate
     */
    GetMaxAvailableFrameRate(pPin, iIndex, Dimensions) {
        result := ComCall(7, this, "ptr", pPin, "int", iIndex, "ptr", Dimensions, "int64*", &MaxAvailableFrameRate := 0, "HRESULT")
        return MaxAvailableFrameRate
    }

    /**
     * The GetFrameRateList method retrieves a list of available frame rates.
     * @param {IPin} pPin Pointer to the pin to query for the list of frame rates.
     * @param {Integer} iIndex Index of the format to query for frame rates. This index corresponds to the order in which formats are enumerated by [VIDEO_STREAM_CONFIG_CAPS](/windows/desktop/api/strmif/ns-strmif-video_stream_config_caps) structures returned by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities">IAMStreamConfig::GetNumberOfCapabilities</a>) minus one.
     * @param {SIZE} Dimensions Frame image size (width and height) in pixels.
     * @param {Pointer<Integer>} ListSize Pointer to the number of elements in the list of frame rates.
     * @param {Pointer<Pointer<Integer>>} FrameRates Address of a pointer to an array of frame rates in 100-nanosecond units. Can be <b>NULL</b> if you only need <i>ListSize</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvideocontrol-getframeratelist
     */
    GetFrameRateList(pPin, iIndex, Dimensions, ListSize, FrameRates) {
        ListSizeMarshal := ListSize is VarRef ? "int*" : "ptr"
        FrameRatesMarshal := FrameRates is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pPin, "int", iIndex, "ptr", Dimensions, ListSizeMarshal, ListSize, FrameRatesMarshal, FrameRates, "HRESULT")
        return result
    }
}
