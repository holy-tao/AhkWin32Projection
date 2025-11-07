#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMExtTransport interface controls the transport on a video tape recporder (VTR) or camcorder.
 * @remarks
 * 
 * The DV device drivers require some additional constants that are defined in the header file Xprtdefs.h.
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-ext-transport">PROPSETID_EXT_TRANSPORT</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * <h3><a id="Hardware_Requirements"></a><a id="hardware_requirements"></a><a id="HARDWARE_REQUIREMENTS"></a>Hardware Requirements</h3>
 * To control an external VCR, certain hardware requirements are recommended. VCRs with an RS-422 serial interface require a special serial port card or an external RS-232-to-RS-422 adapter. In addition, for best performance, your computer should have a serial port card built with a 16550 high-performance UART to sustain higher baud rates, such as 38.4 baud.
 * 
 * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
 * Implement this interface if you are writing a filter that controls an external device with a transport, such as a VTR. If you implement this interface, you should implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamextdevice">IAMExtDevice</a> interface as well.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamexttransport
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMExtTransport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMExtTransport
     * @type {Guid}
     */
    static IID => Guid("{a03cd5f0-3045-11cf-8c44-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapability", "put_MediaState", "get_MediaState", "put_LocalControl", "get_LocalControl", "GetStatus", "GetTransportBasicParameters", "SetTransportBasicParameters", "GetTransportVideoParameters", "SetTransportVideoParameters", "GetTransportAudioParameters", "SetTransportAudioParameters", "put_Mode", "get_Mode", "put_Rate", "get_Rate", "GetChase", "SetChase", "GetBump", "SetBump", "get_AntiClogControl", "put_AntiClogControl", "GetEditPropertySet", "SetEditPropertySet", "GetEditProperty", "SetEditProperty", "get_EditStart", "put_EditStart"]

    /**
     * 
     * @param {Integer} Capability 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Float>} pdblValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getcapability
     */
    GetCapability(Capability, pValue, pdblValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pdblValueMarshal := pdblValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, "int", Capability, pValueMarshal, pValue, pdblValueMarshal, pdblValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_mediastate
     */
    put_MediaState(State) {
        result := ComCall(4, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_mediastate
     */
    get_MediaState() {
        result := ComCall(5, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_localcontrol
     */
    put_LocalControl(State) {
        result := ComCall(6, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_localcontrol
     */
    get_LocalControl() {
        result := ComCall(7, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Integer} StatusItem 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getstatus
     */
    GetStatus(StatusItem) {
        result := ComCall(8, this, "int", StatusItem, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<PWSTR>} ppszData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-gettransportbasicparameters
     */
    GetTransportBasicParameters(Param, pValue, ppszData) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        ppszDataMarshal := ppszData is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "int", Param, pValueMarshal, pValue, ppszDataMarshal, ppszData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @param {PWSTR} pszData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-settransportbasicparameters
     */
    SetTransportBasicParameters(Param, Value, pszData) {
        pszData := pszData is String ? StrPtr(pszData) : pszData

        result := ComCall(10, this, "int", Param, "int", Value, "ptr", pszData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Param 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-gettransportvideoparameters
     */
    GetTransportVideoParameters(Param) {
        result := ComCall(11, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-settransportvideoparameters
     */
    SetTransportVideoParameters(Param, Value) {
        result := ComCall(12, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Param 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-gettransportaudioparameters
     */
    GetTransportAudioParameters(Param) {
        result := ComCall(13, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-settransportaudioparameters
     */
    SetTransportAudioParameters(Param, Value) {
        result := ComCall(14, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_mode
     */
    put_Mode(Mode) {
        result := ComCall(15, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_mode
     */
    get_Mode() {
        result := ComCall(16, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @param {Float} dblRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_rate
     */
    put_Rate(dblRate) {
        result := ComCall(17, this, "double", dblRate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_rate
     */
    get_Rate() {
        result := ComCall(18, this, "double*", &pdblRate := 0, "HRESULT")
        return pdblRate
    }

    /**
     * 
     * @param {Pointer<Integer>} pEnabled 
     * @param {Pointer<Integer>} pOffset 
     * @param {Pointer<Pointer>} phEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getchase
     */
    GetChase(pEnabled, pOffset, phEvent) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"
        pOffsetMarshal := pOffset is VarRef ? "int*" : "ptr"
        phEventMarshal := phEvent is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, pEnabledMarshal, pEnabled, pOffsetMarshal, pOffset, phEventMarshal, phEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Enable 
     * @param {Integer} Offset 
     * @param {Pointer} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-setchase
     */
    SetChase(Enable, Offset, hEvent) {
        result := ComCall(20, this, "int", Enable, "int", Offset, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSpeed 
     * @param {Pointer<Integer>} pDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-getbump
     */
    GetBump(pSpeed, pDuration) {
        pSpeedMarshal := pSpeed is VarRef ? "int*" : "ptr"
        pDurationMarshal := pDuration is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pSpeedMarshal, pSpeed, pDurationMarshal, pDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Speed 
     * @param {Integer} Duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-setbump
     */
    SetBump(Speed, Duration) {
        result := ComCall(22, this, "int", Speed, "int", Duration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_anticlogcontrol
     */
    get_AntiClogControl() {
        result := ComCall(23, this, "int*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * 
     * @param {Integer} Enable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_anticlogcontrol
     */
    put_AntiClogControl(Enable) {
        result := ComCall(24, this, "int", Enable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EditID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-geteditpropertyset
     */
    GetEditPropertySet(EditID) {
        result := ComCall(25, this, "int", EditID, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Pointer<Integer>} pEditID 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-seteditpropertyset
     */
    SetEditPropertySet(pEditID, State) {
        pEditIDMarshal := pEditID is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pEditIDMarshal, pEditID, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EditID 
     * @param {Integer} Param 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-geteditproperty
     */
    GetEditProperty(EditID, Param) {
        result := ComCall(27, this, "int", EditID, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} EditID 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-seteditproperty
     */
    SetEditProperty(EditID, Param, Value) {
        result := ComCall(28, this, "int", EditID, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-get_editstart
     */
    get_EditStart() {
        result := ComCall(29, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamexttransport-put_editstart
     */
    put_EditStart(Value) {
        result := ComCall(30, this, "int", Value, "HRESULT")
        return result
    }
}
