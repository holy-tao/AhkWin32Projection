#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCSession.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Media\DirectShow\IVideoWindow.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClient
     * @type {Guid}
     */
    static IID => Guid("{07829e45-9a34-408e-a011-bddf13487cd1}")

    /**
     * The class identifier for RTCClient
     * @type {Guid}
     */
    static CLSID => Guid("{7a42ea29-a2b7-40c4-b091-f6f024aa89be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Shutdown", "PrepareForShutdown", "put_EventFilter", "get_EventFilter", "SetPreferredMediaTypes", "get_PreferredMediaTypes", "get_MediaCapabilities", "CreateSession", "put_ListenForIncomingSessions", "get_ListenForIncomingSessions", "get_NetworkAddresses", "put_Volume", "get_Volume", "put_AudioMuted", "get_AudioMuted", "get_IVideoWindow", "put_PreferredAudioDevice", "get_PreferredAudioDevice", "put_PreferredVolume", "get_PreferredVolume", "put_PreferredAEC", "get_PreferredAEC", "put_PreferredVideoDevice", "get_PreferredVideoDevice", "get_ActiveMedia", "put_MaxBitrate", "get_MaxBitrate", "put_TemporalSpatialTradeOff", "get_TemporalSpatialTradeOff", "get_NetworkQuality", "StartT120Applet", "StopT120Applets", "get_IsT120AppletRunning", "get_LocalUserURI", "put_LocalUserURI", "get_LocalUserName", "put_LocalUserName", "PlayRing", "SendDTMF", "InvokeTuningWizard", "get_IsTuned"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PrepareForShutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFilter 
     * @returns {HRESULT} 
     */
    put_EventFilter(lFilter) {
        result := ComCall(6, this, "int", lFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventFilter() {
        result := ComCall(7, this, "int*", &plFilter := 0, "HRESULT")
        return plFilter
    }

    /**
     * 
     * @param {Integer} lMediaTypes 
     * @param {VARIANT_BOOL} fPersistent 
     * @returns {HRESULT} 
     */
    SetPreferredMediaTypes(lMediaTypes, fPersistent) {
        result := ComCall(8, this, "int", lMediaTypes, "short", fPersistent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredMediaTypes() {
        result := ComCall(9, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaCapabilities() {
        result := ComCall(10, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * 
     * @param {Integer} enType 
     * @param {BSTR} bstrLocalPhoneURI 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCSession} 
     */
    CreateSession(enType, bstrLocalPhoneURI, pProfile, lFlags) {
        bstrLocalPhoneURI := bstrLocalPhoneURI is String ? BSTR.Alloc(bstrLocalPhoneURI).Value : bstrLocalPhoneURI

        result := ComCall(11, this, "int", enType, "ptr", bstrLocalPhoneURI, "ptr", pProfile, "int", lFlags, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    /**
     * 
     * @param {Integer} enListen 
     * @returns {HRESULT} 
     */
    put_ListenForIncomingSessions(enListen) {
        result := ComCall(12, this, "int", enListen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListenForIncomingSessions() {
        result := ComCall(13, this, "int*", &penListen := 0, "HRESULT")
        return penListen
    }

    /**
     * 
     * @param {VARIANT_BOOL} fTCP 
     * @param {VARIANT_BOOL} fExternal 
     * @returns {VARIANT} 
     */
    get_NetworkAddresses(fTCP, fExternal) {
        pvAddresses := VARIANT()
        result := ComCall(14, this, "short", fTCP, "short", fExternal, "ptr", pvAddresses, "HRESULT")
        return pvAddresses
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_Volume(enDevice, lVolume) {
        result := ComCall(15, this, "int", enDevice, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @returns {Integer} 
     */
    get_Volume(enDevice) {
        result := ComCall(16, this, "int", enDevice, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @param {VARIANT_BOOL} fMuted 
     * @returns {HRESULT} 
     */
    put_AudioMuted(enDevice, fMuted) {
        result := ComCall(17, this, "int", enDevice, "short", fMuted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @returns {VARIANT_BOOL} 
     */
    get_AudioMuted(enDevice) {
        result := ComCall(18, this, "int", enDevice, "short*", &pfMuted := 0, "HRESULT")
        return pfMuted
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @returns {IVideoWindow} 
     */
    get_IVideoWindow(enDevice) {
        result := ComCall(19, this, "int", enDevice, "ptr*", &ppIVideoWindow := 0, "HRESULT")
        return IVideoWindow(ppIVideoWindow)
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     */
    put_PreferredAudioDevice(enDevice, bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(20, this, "int", enDevice, "ptr", bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @returns {BSTR} 
     */
    get_PreferredAudioDevice(enDevice) {
        pbstrDeviceName := BSTR()
        result := ComCall(21, this, "int", enDevice, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_PreferredVolume(enDevice, lVolume) {
        result := ComCall(22, this, "int", enDevice, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enDevice 
     * @returns {Integer} 
     */
    get_PreferredVolume(enDevice) {
        result := ComCall(23, this, "int", enDevice, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnable 
     * @returns {HRESULT} 
     */
    put_PreferredAEC(bEnable) {
        result := ComCall(24, this, "short", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_PreferredAEC() {
        result := ComCall(25, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     */
    put_PreferredVideoDevice(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(26, this, "ptr", bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PreferredVideoDevice() {
        pbstrDeviceName := BSTR()
        result := ComCall(27, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActiveMedia() {
        result := ComCall(28, this, "int*", &plMediaType := 0, "HRESULT")
        return plMediaType
    }

    /**
     * 
     * @param {Integer} lMaxBitrate 
     * @returns {HRESULT} 
     */
    put_MaxBitrate(lMaxBitrate) {
        result := ComCall(29, this, "int", lMaxBitrate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBitrate() {
        result := ComCall(30, this, "int*", &plMaxBitrate := 0, "HRESULT")
        return plMaxBitrate
    }

    /**
     * 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    put_TemporalSpatialTradeOff(lValue) {
        result := ComCall(31, this, "int", lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TemporalSpatialTradeOff() {
        result := ComCall(32, this, "int*", &plValue := 0, "HRESULT")
        return plValue
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkQuality() {
        result := ComCall(33, this, "int*", &plNetworkQuality := 0, "HRESULT")
        return plNetworkQuality
    }

    /**
     * 
     * @param {Integer} enApplet 
     * @returns {HRESULT} 
     */
    StartT120Applet(enApplet) {
        result := ComCall(34, this, "int", enApplet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopT120Applets() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enApplet 
     * @returns {VARIANT_BOOL} 
     */
    get_IsT120AppletRunning(enApplet) {
        result := ComCall(36, this, "int", enApplet, "short*", &pfRunning := 0, "HRESULT")
        return pfRunning
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalUserURI() {
        pbstrUserURI := BSTR()
        result := ComCall(37, this, "ptr", pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @param {BSTR} bstrUserURI 
     * @returns {HRESULT} 
     */
    put_LocalUserURI(bstrUserURI) {
        bstrUserURI := bstrUserURI is String ? BSTR.Alloc(bstrUserURI).Value : bstrUserURI

        result := ComCall(38, this, "ptr", bstrUserURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalUserName() {
        pbstrUserName := BSTR()
        result := ComCall(39, this, "ptr", pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     */
    put_LocalUserName(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(40, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enType 
     * @param {VARIANT_BOOL} bPlay 
     * @returns {HRESULT} 
     */
    PlayRing(enType, bPlay) {
        result := ComCall(41, this, "int", enType, "short", bPlay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enDTMF 
     * @returns {HRESULT} 
     */
    SendDTMF(enDTMF) {
        result := ComCall(42, this, "int", enDTMF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hwndParent 
     * @returns {HRESULT} 
     */
    InvokeTuningWizard(hwndParent) {
        result := ComCall(43, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsTuned() {
        result := ComCall(44, this, "short*", &pfTuned := 0, "HRESULT")
        return pfTuned
    }
}
