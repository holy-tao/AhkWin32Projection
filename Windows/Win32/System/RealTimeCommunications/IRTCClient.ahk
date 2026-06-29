#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_AUDIO_DEVICE.ahk" { RTC_AUDIO_DEVICE }
#Import ".\RTC_SESSION_TYPE.ahk" { RTC_SESSION_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_LISTEN_MODE.ahk" { RTC_LISTEN_MODE }
#Import "..\..\Media\DirectShow\IVideoWindow.ahk" { IVideoWindow }
#Import ".\RTC_VIDEO_DEVICE.ahk" { RTC_VIDEO_DEVICE }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IRTCSession.ahk" { IRTCSession }
#Import ".\RTC_T120_APPLET.ahk" { RTC_T120_APPLET }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RTC_DTMF.ahk" { RTC_DTMF }
#Import ".\RTC_RING_TYPE.ahk" { RTC_RING_TYPE }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClient extends IUnknown {
    /**
     * The interface identifier for IRTCClient
     * @type {Guid}
     */
    static IID := Guid("{07829e45-9a34-408e-a011-bddf13487cd1}")

    /**
     * The class identifier for RTCClient
     * @type {Guid}
     */
    static CLSID := Guid("{7a42ea29-a2b7-40c4-b091-f6f024aa89be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                    : IntPtr
        Shutdown                      : IntPtr
        PrepareForShutdown            : IntPtr
        put_EventFilter               : IntPtr
        get_EventFilter               : IntPtr
        SetPreferredMediaTypes        : IntPtr
        get_PreferredMediaTypes       : IntPtr
        get_MediaCapabilities         : IntPtr
        CreateSession                 : IntPtr
        put_ListenForIncomingSessions : IntPtr
        get_ListenForIncomingSessions : IntPtr
        get_NetworkAddresses          : IntPtr
        put_Volume                    : IntPtr
        get_Volume                    : IntPtr
        put_AudioMuted                : IntPtr
        get_AudioMuted                : IntPtr
        get_IVideoWindow              : IntPtr
        put_PreferredAudioDevice      : IntPtr
        get_PreferredAudioDevice      : IntPtr
        put_PreferredVolume           : IntPtr
        get_PreferredVolume           : IntPtr
        put_PreferredAEC              : IntPtr
        get_PreferredAEC              : IntPtr
        put_PreferredVideoDevice      : IntPtr
        get_PreferredVideoDevice      : IntPtr
        get_ActiveMedia               : IntPtr
        put_MaxBitrate                : IntPtr
        get_MaxBitrate                : IntPtr
        put_TemporalSpatialTradeOff   : IntPtr
        get_TemporalSpatialTradeOff   : IntPtr
        get_NetworkQuality            : IntPtr
        StartT120Applet               : IntPtr
        StopT120Applets               : IntPtr
        get_IsT120AppletRunning       : IntPtr
        get_LocalUserURI              : IntPtr
        put_LocalUserURI              : IntPtr
        get_LocalUserName             : IntPtr
        put_LocalUserName             : IntPtr
        PlayRing                      : IntPtr
        SendDTMF                      : IntPtr
        InvokeTuningWizard            : IntPtr
        get_IsTuned                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    EventFilter {
        get => this.get_EventFilter()
        set => this.put_EventFilter(value)
    }

    /**
     * @type {Integer} 
     */
    PreferredMediaTypes {
        get => this.get_PreferredMediaTypes()
    }

    /**
     * @type {Integer} 
     */
    MediaCapabilities {
        get => this.get_MediaCapabilities()
    }

    /**
     * @type {RTC_LISTEN_MODE} 
     */
    ListenForIncomingSessions {
        get => this.get_ListenForIncomingSessions()
        set => this.put_ListenForIncomingSessions(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PreferredAEC {
        get => this.get_PreferredAEC()
        set => this.put_PreferredAEC(value)
    }

    /**
     * @type {BSTR} 
     */
    PreferredVideoDevice {
        get => this.get_PreferredVideoDevice()
        set => this.put_PreferredVideoDevice(value)
    }

    /**
     * @type {Integer} 
     */
    ActiveMedia {
        get => this.get_ActiveMedia()
    }

    /**
     * @type {Integer} 
     */
    MaxBitrate {
        get => this.get_MaxBitrate()
        set => this.put_MaxBitrate(value)
    }

    /**
     * @type {Integer} 
     */
    TemporalSpatialTradeOff {
        get => this.get_TemporalSpatialTradeOff()
        set => this.put_TemporalSpatialTradeOff(value)
    }

    /**
     * @type {Integer} 
     */
    NetworkQuality {
        get => this.get_NetworkQuality()
    }

    /**
     * @type {BSTR} 
     */
    LocalUserURI {
        get => this.get_LocalUserURI()
        set => this.put_LocalUserURI(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalUserName {
        get => this.get_LocalUserName()
        set => this.put_LocalUserName(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsTuned {
        get => this.get_IsTuned()
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Stops the collector. If the collector is running as a service, stopping the service is the better approach.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-shutdown
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
        result := ComCall(8, this, "int", lMediaTypes, VARIANT_BOOL, fPersistent, "HRESULT")
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
     * @param {RTC_SESSION_TYPE} enType 
     * @param {BSTR} bstrLocalPhoneURI 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCSession} 
     */
    CreateSession(enType, bstrLocalPhoneURI, pProfile, lFlags) {
        bstrLocalPhoneURI := bstrLocalPhoneURI is String ? BSTR.Alloc(bstrLocalPhoneURI).Value : bstrLocalPhoneURI

        result := ComCall(11, this, RTC_SESSION_TYPE, enType, BSTR, bstrLocalPhoneURI, "ptr", pProfile, "int", lFlags, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    /**
     * 
     * @param {RTC_LISTEN_MODE} enListen 
     * @returns {HRESULT} 
     */
    put_ListenForIncomingSessions(enListen) {
        result := ComCall(12, this, RTC_LISTEN_MODE, enListen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RTC_LISTEN_MODE} 
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
        result := ComCall(14, this, VARIANT_BOOL, fTCP, VARIANT_BOOL, fExternal, VARIANT.Ptr, pvAddresses, "HRESULT")
        return pvAddresses
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_Volume(enDevice, lVolume) {
        result := ComCall(15, this, RTC_AUDIO_DEVICE, enDevice, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @returns {Integer} 
     */
    get_Volume(enDevice) {
        result := ComCall(16, this, RTC_AUDIO_DEVICE, enDevice, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @param {VARIANT_BOOL} fMuted 
     * @returns {HRESULT} 
     */
    put_AudioMuted(enDevice, fMuted) {
        result := ComCall(17, this, RTC_AUDIO_DEVICE, enDevice, VARIANT_BOOL, fMuted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @returns {VARIANT_BOOL} 
     */
    get_AudioMuted(enDevice) {
        result := ComCall(18, this, RTC_AUDIO_DEVICE, enDevice, VARIANT_BOOL.Ptr, &pfMuted := 0, "HRESULT")
        return pfMuted
    }

    /**
     * 
     * @param {RTC_VIDEO_DEVICE} enDevice 
     * @returns {IVideoWindow} 
     */
    get_IVideoWindow(enDevice) {
        result := ComCall(19, this, RTC_VIDEO_DEVICE, enDevice, "ptr*", &ppIVideoWindow := 0, "HRESULT")
        return IVideoWindow(ppIVideoWindow)
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     */
    put_PreferredAudioDevice(enDevice, bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(20, this, RTC_AUDIO_DEVICE, enDevice, BSTR, bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @returns {BSTR} 
     */
    get_PreferredAudioDevice(enDevice) {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(21, this, RTC_AUDIO_DEVICE, enDevice, BSTR.Ptr, pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_PreferredVolume(enDevice, lVolume) {
        result := ComCall(22, this, RTC_AUDIO_DEVICE, enDevice, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_AUDIO_DEVICE} enDevice 
     * @returns {Integer} 
     */
    get_PreferredVolume(enDevice) {
        result := ComCall(23, this, RTC_AUDIO_DEVICE, enDevice, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnable 
     * @returns {HRESULT} 
     */
    put_PreferredAEC(bEnable) {
        result := ComCall(24, this, VARIANT_BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_PreferredAEC() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @returns {HRESULT} 
     */
    put_PreferredVideoDevice(bstrDeviceName) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(26, this, BSTR, bstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PreferredVideoDevice() {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, pbstrDeviceName, "HRESULT")
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
     * @param {RTC_T120_APPLET} enApplet 
     * @returns {HRESULT} 
     */
    StartT120Applet(enApplet) {
        result := ComCall(34, this, RTC_T120_APPLET, enApplet, "HRESULT")
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
     * @param {RTC_T120_APPLET} enApplet 
     * @returns {VARIANT_BOOL} 
     */
    get_IsT120AppletRunning(enApplet) {
        result := ComCall(36, this, RTC_T120_APPLET, enApplet, VARIANT_BOOL.Ptr, &pfRunning := 0, "HRESULT")
        return pfRunning
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalUserURI() {
        pbstrUserURI := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @param {BSTR} bstrUserURI 
     * @returns {HRESULT} 
     */
    put_LocalUserURI(bstrUserURI) {
        bstrUserURI := bstrUserURI is String ? BSTR.Alloc(bstrUserURI).Value : bstrUserURI

        result := ComCall(38, this, BSTR, bstrUserURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalUserName() {
        pbstrUserName := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     */
    put_LocalUserName(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(40, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_RING_TYPE} enType 
     * @param {VARIANT_BOOL} bPlay 
     * @returns {HRESULT} 
     */
    PlayRing(enType, bPlay) {
        result := ComCall(41, this, RTC_RING_TYPE, enType, VARIANT_BOOL, bPlay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_DTMF} enDTMF 
     * @returns {HRESULT} 
     */
    SendDTMF(enDTMF) {
        result := ComCall(42, this, RTC_DTMF, enDTMF, "HRESULT")
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
        result := ComCall(44, this, VARIANT_BOOL.Ptr, &pfTuned := 0, "HRESULT")
        return pfTuned
    }

    Query(iid) {
        if (IRTCClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 1)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
        this.vtbl.PrepareForShutdown := CallbackCreate(GetMethod(implObj, "PrepareForShutdown"), flags, 1)
        this.vtbl.put_EventFilter := CallbackCreate(GetMethod(implObj, "put_EventFilter"), flags, 2)
        this.vtbl.get_EventFilter := CallbackCreate(GetMethod(implObj, "get_EventFilter"), flags, 2)
        this.vtbl.SetPreferredMediaTypes := CallbackCreate(GetMethod(implObj, "SetPreferredMediaTypes"), flags, 3)
        this.vtbl.get_PreferredMediaTypes := CallbackCreate(GetMethod(implObj, "get_PreferredMediaTypes"), flags, 2)
        this.vtbl.get_MediaCapabilities := CallbackCreate(GetMethod(implObj, "get_MediaCapabilities"), flags, 2)
        this.vtbl.CreateSession := CallbackCreate(GetMethod(implObj, "CreateSession"), flags, 6)
        this.vtbl.put_ListenForIncomingSessions := CallbackCreate(GetMethod(implObj, "put_ListenForIncomingSessions"), flags, 2)
        this.vtbl.get_ListenForIncomingSessions := CallbackCreate(GetMethod(implObj, "get_ListenForIncomingSessions"), flags, 2)
        this.vtbl.get_NetworkAddresses := CallbackCreate(GetMethod(implObj, "get_NetworkAddresses"), flags, 4)
        this.vtbl.put_Volume := CallbackCreate(GetMethod(implObj, "put_Volume"), flags, 3)
        this.vtbl.get_Volume := CallbackCreate(GetMethod(implObj, "get_Volume"), flags, 3)
        this.vtbl.put_AudioMuted := CallbackCreate(GetMethod(implObj, "put_AudioMuted"), flags, 3)
        this.vtbl.get_AudioMuted := CallbackCreate(GetMethod(implObj, "get_AudioMuted"), flags, 3)
        this.vtbl.get_IVideoWindow := CallbackCreate(GetMethod(implObj, "get_IVideoWindow"), flags, 3)
        this.vtbl.put_PreferredAudioDevice := CallbackCreate(GetMethod(implObj, "put_PreferredAudioDevice"), flags, 3)
        this.vtbl.get_PreferredAudioDevice := CallbackCreate(GetMethod(implObj, "get_PreferredAudioDevice"), flags, 3)
        this.vtbl.put_PreferredVolume := CallbackCreate(GetMethod(implObj, "put_PreferredVolume"), flags, 3)
        this.vtbl.get_PreferredVolume := CallbackCreate(GetMethod(implObj, "get_PreferredVolume"), flags, 3)
        this.vtbl.put_PreferredAEC := CallbackCreate(GetMethod(implObj, "put_PreferredAEC"), flags, 2)
        this.vtbl.get_PreferredAEC := CallbackCreate(GetMethod(implObj, "get_PreferredAEC"), flags, 2)
        this.vtbl.put_PreferredVideoDevice := CallbackCreate(GetMethod(implObj, "put_PreferredVideoDevice"), flags, 2)
        this.vtbl.get_PreferredVideoDevice := CallbackCreate(GetMethod(implObj, "get_PreferredVideoDevice"), flags, 2)
        this.vtbl.get_ActiveMedia := CallbackCreate(GetMethod(implObj, "get_ActiveMedia"), flags, 2)
        this.vtbl.put_MaxBitrate := CallbackCreate(GetMethod(implObj, "put_MaxBitrate"), flags, 2)
        this.vtbl.get_MaxBitrate := CallbackCreate(GetMethod(implObj, "get_MaxBitrate"), flags, 2)
        this.vtbl.put_TemporalSpatialTradeOff := CallbackCreate(GetMethod(implObj, "put_TemporalSpatialTradeOff"), flags, 2)
        this.vtbl.get_TemporalSpatialTradeOff := CallbackCreate(GetMethod(implObj, "get_TemporalSpatialTradeOff"), flags, 2)
        this.vtbl.get_NetworkQuality := CallbackCreate(GetMethod(implObj, "get_NetworkQuality"), flags, 2)
        this.vtbl.StartT120Applet := CallbackCreate(GetMethod(implObj, "StartT120Applet"), flags, 2)
        this.vtbl.StopT120Applets := CallbackCreate(GetMethod(implObj, "StopT120Applets"), flags, 1)
        this.vtbl.get_IsT120AppletRunning := CallbackCreate(GetMethod(implObj, "get_IsT120AppletRunning"), flags, 3)
        this.vtbl.get_LocalUserURI := CallbackCreate(GetMethod(implObj, "get_LocalUserURI"), flags, 2)
        this.vtbl.put_LocalUserURI := CallbackCreate(GetMethod(implObj, "put_LocalUserURI"), flags, 2)
        this.vtbl.get_LocalUserName := CallbackCreate(GetMethod(implObj, "get_LocalUserName"), flags, 2)
        this.vtbl.put_LocalUserName := CallbackCreate(GetMethod(implObj, "put_LocalUserName"), flags, 2)
        this.vtbl.PlayRing := CallbackCreate(GetMethod(implObj, "PlayRing"), flags, 3)
        this.vtbl.SendDTMF := CallbackCreate(GetMethod(implObj, "SendDTMF"), flags, 2)
        this.vtbl.InvokeTuningWizard := CallbackCreate(GetMethod(implObj, "InvokeTuningWizard"), flags, 2)
        this.vtbl.get_IsTuned := CallbackCreate(GetMethod(implObj, "get_IsTuned"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Shutdown)
        CallbackFree(this.vtbl.PrepareForShutdown)
        CallbackFree(this.vtbl.put_EventFilter)
        CallbackFree(this.vtbl.get_EventFilter)
        CallbackFree(this.vtbl.SetPreferredMediaTypes)
        CallbackFree(this.vtbl.get_PreferredMediaTypes)
        CallbackFree(this.vtbl.get_MediaCapabilities)
        CallbackFree(this.vtbl.CreateSession)
        CallbackFree(this.vtbl.put_ListenForIncomingSessions)
        CallbackFree(this.vtbl.get_ListenForIncomingSessions)
        CallbackFree(this.vtbl.get_NetworkAddresses)
        CallbackFree(this.vtbl.put_Volume)
        CallbackFree(this.vtbl.get_Volume)
        CallbackFree(this.vtbl.put_AudioMuted)
        CallbackFree(this.vtbl.get_AudioMuted)
        CallbackFree(this.vtbl.get_IVideoWindow)
        CallbackFree(this.vtbl.put_PreferredAudioDevice)
        CallbackFree(this.vtbl.get_PreferredAudioDevice)
        CallbackFree(this.vtbl.put_PreferredVolume)
        CallbackFree(this.vtbl.get_PreferredVolume)
        CallbackFree(this.vtbl.put_PreferredAEC)
        CallbackFree(this.vtbl.get_PreferredAEC)
        CallbackFree(this.vtbl.put_PreferredVideoDevice)
        CallbackFree(this.vtbl.get_PreferredVideoDevice)
        CallbackFree(this.vtbl.get_ActiveMedia)
        CallbackFree(this.vtbl.put_MaxBitrate)
        CallbackFree(this.vtbl.get_MaxBitrate)
        CallbackFree(this.vtbl.put_TemporalSpatialTradeOff)
        CallbackFree(this.vtbl.get_TemporalSpatialTradeOff)
        CallbackFree(this.vtbl.get_NetworkQuality)
        CallbackFree(this.vtbl.StartT120Applet)
        CallbackFree(this.vtbl.StopT120Applets)
        CallbackFree(this.vtbl.get_IsT120AppletRunning)
        CallbackFree(this.vtbl.get_LocalUserURI)
        CallbackFree(this.vtbl.put_LocalUserURI)
        CallbackFree(this.vtbl.get_LocalUserName)
        CallbackFree(this.vtbl.put_LocalUserName)
        CallbackFree(this.vtbl.PlayRing)
        CallbackFree(this.vtbl.SendDTMF)
        CallbackFree(this.vtbl.InvokeTuningWizard)
        CallbackFree(this.vtbl.get_IsTuned)
    }
}
