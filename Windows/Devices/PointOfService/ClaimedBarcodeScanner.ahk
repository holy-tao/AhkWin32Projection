#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedBarcodeScanner.ahk
#Include .\IClaimedBarcodeScanner1.ahk
#Include .\IClaimedBarcodeScanner2.ahk
#Include .\IClaimedBarcodeScanner3.ahk
#Include .\IClaimedBarcodeScanner4.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ClaimedBarcodeScanner.ahk
#Include .\BarcodeScannerDataReceivedEventArgs.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include .\BarcodeScannerImagePreviewReceivedEventArgs.ahk
#Include .\BarcodeScannerErrorOccurredEventArgs.ahk
#Include .\ClaimedBarcodeScannerClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the claimed barcode scanner.
 * @remarks
 * The object is created when [ClaimScannerAsync](barcodescanner_claimscannerasync_558793678.md) method completes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedBarcodeScanner extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedBarcodeScanner

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedBarcodeScanner.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the claimed barcode scanner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Indicates whether the barcode scanner can receive [DataReceived](claimedbarcodescanner_datareceived.md) events.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets or sets a Boolean value that indicates whether the barcode scanner is disabled after receiving the data.
     * @remarks
     * When IsDisabledOnDataReceived is true, the application can only received one data at a time and the device is disabled after the [DataReceived](claimedbarcodescanner_datareceived.md) event. The application must call [EnableAsync](claimedbarcodescanner_enableasync_208845947.md) to enable the device to received data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.isdisabledondatareceived
     * @type {Boolean} 
     */
    IsDisabledOnDataReceived {
        get => this.get_IsDisabledOnDataReceived()
        set => this.put_IsDisabledOnDataReceived(value)
    }

    /**
     * Gets or sets a Boolean value that indicates whether to provide the decoded data to the service object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.isdecodedataenabled
     * @type {Boolean} 
     */
    IsDecodeDataEnabled {
        get => this.get_IsDecodeDataEnabled()
        set => this.put_IsDecodeDataEnabled(value)
    }

    /**
     * Gets or sets whether to show the video preview window when the barcode scanner is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.isvideopreviewshownonenable
     * @type {Boolean} 
     */
    IsVideoPreviewShownOnEnable {
        get => this.get_IsVideoPreviewShownOnEnable()
        set => this.put_IsVideoPreviewShownOnEnable(value)
    }

    /**
     * Occurs when the device scans a barcode.
     * @type {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerDataReceivedEventArgs>}
    */
    OnDataReceived {
        get {
            if(!this.HasProp("__OnDataReceived")){
                this.__OnDataReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4f64e49a-bd8c-549d-970c-a5a250bd27ca}"),
                    ClaimedBarcodeScanner,
                    BarcodeScannerDataReceivedEventArgs
                )
                this.__OnDataReceivedToken := this.add_DataReceived(this.__OnDataReceived.iface)
            }
            return this.__OnDataReceived
        }
    }

    /**
     * Occurs when the barcode scanner trigger or button is pressed during a scanning operation.
     * @type {EventHandler<ClaimedBarcodeScanner>}
    */
    OnTriggerPressed {
        get {
            if(!this.HasProp("__OnTriggerPressed")){
                this.__OnTriggerPressed := WinRTEventHandler(
                    EventHandler,
                    Guid("{62074882-1084-597b-bbef-24bfd058366a}"),
                    IInspectable,
                    ClaimedBarcodeScanner
                )
                this.__OnTriggerPressedToken := this.add_TriggerPressed(this.__OnTriggerPressed.iface)
            }
            return this.__OnTriggerPressed
        }
    }

    /**
     * Occurs when the barcode scanner trigger or button is released during a scanning operation.
     * @type {EventHandler<ClaimedBarcodeScanner>}
    */
    OnTriggerReleased {
        get {
            if(!this.HasProp("__OnTriggerReleased")){
                this.__OnTriggerReleased := WinRTEventHandler(
                    EventHandler,
                    Guid("{62074882-1084-597b-bbef-24bfd058366a}"),
                    IInspectable,
                    ClaimedBarcodeScanner
                )
                this.__OnTriggerReleasedToken := this.add_TriggerReleased(this.__OnTriggerReleased.iface)
            }
            return this.__OnTriggerReleased
        }
    }

    /**
     * Occurs when the device gets a request to release its exclusive claim.
     * @remarks
     * If your application receives a ReleaseDeviceRequested event from another application, it may lose its exclusive claim unless your application retains the device.
     * @type {EventHandler<ClaimedBarcodeScanner>}
    */
    OnReleaseDeviceRequested {
        get {
            if(!this.HasProp("__OnReleaseDeviceRequested")){
                this.__OnReleaseDeviceRequested := WinRTEventHandler(
                    EventHandler,
                    Guid("{62074882-1084-597b-bbef-24bfd058366a}"),
                    IInspectable,
                    ClaimedBarcodeScanner
                )
                this.__OnReleaseDeviceRequestedToken := this.add_ReleaseDeviceRequested(this.__OnReleaseDeviceRequested.iface)
            }
            return this.__OnReleaseDeviceRequested
        }
    }

    /**
     * Occurs when the device receives the bitmap image of the scan.
     * @type {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerImagePreviewReceivedEventArgs>}
    */
    OnImagePreviewReceived {
        get {
            if(!this.HasProp("__OnImagePreviewReceived")){
                this.__OnImagePreviewReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fba116af-2a39-516f-a579-cc3eaf36a34b}"),
                    ClaimedBarcodeScanner,
                    BarcodeScannerImagePreviewReceivedEventArgs
                )
                this.__OnImagePreviewReceivedToken := this.add_ImagePreviewReceived(this.__OnImagePreviewReceived.iface)
            }
            return this.__OnImagePreviewReceived
        }
    }

    /**
     * Occurs when there is a problem in reading a barcode.
     * @type {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerErrorOccurredEventArgs>}
    */
    OnErrorOccurred {
        get {
            if(!this.HasProp("__OnErrorOccurred")){
                this.__OnErrorOccurred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ba42ff49-de12-5406-979e-06c45ca2d5a4}"),
                    ClaimedBarcodeScanner,
                    BarcodeScannerErrorOccurredEventArgs
                )
                this.__OnErrorOccurredToken := this.add_ErrorOccurred(this.__OnErrorOccurred.iface)
            }
            return this.__OnErrorOccurred
        }
    }

    /**
     * Event that is raised when the **ClaimedBarcodeScanner** is closed.
     * @remarks
     * When an application is suspended, all **ClaimedBarcodeScanner** objects are closed. This event can be useful to determine when barcode scanner connections need to be re-established.
     * @type {TypedEventHandler<ClaimedBarcodeScanner, ClaimedBarcodeScannerClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{832b28d4-6f20-56d8-a9ab-818fbb922c78}"),
                    ClaimedBarcodeScanner,
                    ClaimedBarcodeScannerClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDataReceivedToken")) {
            this.remove_DataReceived(this.__OnDataReceivedToken)
            this.__OnDataReceived.iface.Dispose()
        }

        if(this.HasProp("__OnTriggerPressedToken")) {
            this.remove_TriggerPressed(this.__OnTriggerPressedToken)
            this.__OnTriggerPressed.iface.Dispose()
        }

        if(this.HasProp("__OnTriggerReleasedToken")) {
            this.remove_TriggerReleased(this.__OnTriggerReleasedToken)
            this.__OnTriggerReleased.iface.Dispose()
        }

        if(this.HasProp("__OnReleaseDeviceRequestedToken")) {
            this.remove_ReleaseDeviceRequested(this.__OnReleaseDeviceRequestedToken)
            this.__OnReleaseDeviceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnImagePreviewReceivedToken")) {
            this.remove_ImagePreviewReceived(this.__OnImagePreviewReceivedToken)
            this.__OnImagePreviewReceived.iface.Dispose()
        }

        if(this.HasProp("__OnErrorOccurredToken")) {
            this.remove_ErrorOccurred(this.__OnErrorOccurredToken)
            this.__OnErrorOccurred.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDisabledOnDataReceived(value) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.put_IsDisabledOnDataReceived(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledOnDataReceived() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.get_IsDisabledOnDataReceived()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDecodeDataEnabled(value) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.put_IsDecodeDataEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecodeDataEnabled() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.get_IsDecodeDataEnabled()
    }

    /**
     * Gets the barcode scanner into a ready state for [DataReceived](claimedbarcodescanner_datareceived.md) events.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.enableasync
     */
    EnableAsync() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.EnableAsync()
    }

    /**
     * Puts the barcode scanner into a state where it cannot receive [DataReceived](claimedbarcodescanner_datareceived.md) events.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.disableasync
     */
    DisableAsync() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.DisableAsync()
    }

    /**
     * Retains exclusive claim to the barcode scanner.
     * @remarks
     * When the application receives a request to release its exclusive claim to the barcode scanner, it must call RetainDevice, otherwise it will lose its claim to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.retaindevice
     */
    RetainDevice() {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.RetainDevice()
    }

    /**
     * Sets the barcode symbologies for the device to use.
     * @param {IIterable<Integer>} symbologies The specific symbologies to use.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.setactivesymbologiesasync
     */
    SetActiveSymbologiesAsync(symbologies) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.SetActiveSymbologiesAsync(symbologies)
    }

    /**
     * Resets the specified statistics to zero for all statistics that can be reset.
     * @param {IIterable<HSTRING>} statisticsCategories The list of names of the statistics to reset. 
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS defined statistics.
     * + "M_" retrieves all manufacturer defined statistics.
     * + "name1" and/or "name2" retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and groups names ("name3", "U_", "M_").
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.resetstatisticsasync
     */
    ResetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.ResetStatisticsAsync(statisticsCategories)
    }

    /**
     * Updates the specified statistics.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} statistics The list of key-value pairs of statistics to update. 
     * + An empty string ("", "value1") sets all statistics that can be set to value1.
     * + "U_", "value2" sets all UnifiedPOS defined statistics that can be set to value2.
     * + "M_", "value3" sets all manufacturer defined statistics that can be set to value3.
     * + "name1", "value4" sets specific named statistics as defined by the UnifiedPOS or manufacturer to value4.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.updatestatisticsasync
     */
    UpdateStatisticsAsync(statistics) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.UpdateStatisticsAsync(statistics)
    }

    /**
     * Sets the active profile on the barcode scanner.
     * 
     * > [!IMPORTANT]
     * > This API applies only to Build 10240 and Build 10586 of the Windows Mobile device family (Windows Mobile Extensions for the UWP). This API doesn't apply to the Windows Desktop device family, nor to other device families, nor to builds of Windows Mobile other than 10240 and 10586. When called on an operating system (OS) to which it doesn't apply, the behavior of this API is undefined. For more info about device families, see [Device family extension SDKs and API contracts](/uwp/extension-sdks/).
     * @remarks
     * The input parameter must match one of the supported profiles. For more information, see [GetSupportedProfiles](barcodescanner_getsupportedprofiles_321103645.md) or [IsProfileSupported](barcodescanner_isprofilesupported_1386341468.md).
     * 
     * Barcode scanners can support a number of features beyond scanning, such as focal length and scan duration. These features are typically exposed through settings or properties and can be as many as 100 on complex devices. The simplify the model of scanner configuration, one or more profiles are exposed to application developers with each profile containing one or more OEM defined settings.
     * @param {HSTRING} profile_ The name of the profile to set on the device.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.setactiveprofileasync
     */
    SetActiveProfileAsync(profile_) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.SetActiveProfileAsync(profile_)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataReceived(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.add_DataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DataReceived(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.remove_DataReceived(token)
    }

    /**
     * 
     * @param {EventHandler<ClaimedBarcodeScanner>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TriggerPressed(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.add_TriggerPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TriggerPressed(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.remove_TriggerPressed(token)
    }

    /**
     * 
     * @param {EventHandler<ClaimedBarcodeScanner>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TriggerReleased(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.add_TriggerReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TriggerReleased(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.remove_TriggerReleased(token)
    }

    /**
     * 
     * @param {EventHandler<ClaimedBarcodeScanner>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.add_ReleaseDeviceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReleaseDeviceRequested(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.remove_ReleaseDeviceRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerImagePreviewReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImagePreviewReceived(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.add_ImagePreviewReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImagePreviewReceived(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.remove_ImagePreviewReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.add_ErrorOccurred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorOccurred(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner := IClaimedBarcodeScanner(outPtr)
        }

        return this.__IClaimedBarcodeScanner.remove_ErrorOccurred(token)
    }

    /**
     * Used to signal the barcode scanner to start scanning. A session is active until [StopSoftwareTriggerAsync](claimedbarcodescanner_stopsoftwaretriggerasync_1202164471.md) is invoked, or until the scanner ends the session on its own.
     * @remarks
     * When barcode data is received, your [DataReceived](/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.datareceived) event handler is called. Also see [Use a software trigger](/windows/uwp/devices-sensors/pos-barcodescanner-software-trigger), and the [Barcode scanner sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/BarcodeScanner) application.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.startsoftwaretriggerasync
     */
    StartSoftwareTriggerAsync() {
        if (!this.HasProp("__IClaimedBarcodeScanner1")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner1.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner1 := IClaimedBarcodeScanner1(outPtr)
        }

        return this.__IClaimedBarcodeScanner1.StartSoftwareTriggerAsync()
    }

    /**
     * Used to stop a session that was started with [StartSoftwareTriggerAsync](claimedbarcodescanner_startsoftwaretriggerasync_1426624742.md). No error is raised if this is called when no session is active.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.stopsoftwaretriggerasync
     */
    StopSoftwareTriggerAsync() {
        if (!this.HasProp("__IClaimedBarcodeScanner1")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner1.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner1 := IClaimedBarcodeScanner1(outPtr)
        }

        return this.__IClaimedBarcodeScanner1.StopSoftwareTriggerAsync()
    }

    /**
     * Gets the attributes of the specified barcode symbology.
     * @param {Integer} barcodeSymbology The barcode symbology.
     * @returns {IAsyncOperation<BarcodeSymbologyAttributes>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.getsymbologyattributesasync
     */
    GetSymbologyAttributesAsync(barcodeSymbology) {
        if (!this.HasProp("__IClaimedBarcodeScanner2")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner2 := IClaimedBarcodeScanner2(outPtr)
        }

        return this.__IClaimedBarcodeScanner2.GetSymbologyAttributesAsync(barcodeSymbology)
    }

    /**
     * Sets the attributes of the barcode symbology used by the claimed barcode scanner.
     * @param {Integer} barcodeSymbology The barcode symbology.
     * @param {BarcodeSymbologyAttributes} attributes The barcode symbology attributes.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.setsymbologyattributesasync
     */
    SetSymbologyAttributesAsync(barcodeSymbology, attributes) {
        if (!this.HasProp("__IClaimedBarcodeScanner2")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner2 := IClaimedBarcodeScanner2(outPtr)
        }

        return this.__IClaimedBarcodeScanner2.SetSymbologyAttributesAsync(barcodeSymbology, attributes)
    }

    /**
     * Shows the video preview window.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.showvideopreviewasync
     */
    ShowVideoPreviewAsync() {
        if (!this.HasProp("__IClaimedBarcodeScanner3")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner3 := IClaimedBarcodeScanner3(outPtr)
        }

        return this.__IClaimedBarcodeScanner3.ShowVideoPreviewAsync()
    }

    /**
     * Hides the video preview window.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.hidevideopreview
     */
    HideVideoPreview() {
        if (!this.HasProp("__IClaimedBarcodeScanner3")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner3 := IClaimedBarcodeScanner3(outPtr)
        }

        return this.__IClaimedBarcodeScanner3.HideVideoPreview()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVideoPreviewShownOnEnable(value) {
        if (!this.HasProp("__IClaimedBarcodeScanner3")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner3 := IClaimedBarcodeScanner3(outPtr)
        }

        return this.__IClaimedBarcodeScanner3.put_IsVideoPreviewShownOnEnable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoPreviewShownOnEnable() {
        if (!this.HasProp("__IClaimedBarcodeScanner3")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner3 := IClaimedBarcodeScanner3(outPtr)
        }

        return this.__IClaimedBarcodeScanner3.get_IsVideoPreviewShownOnEnable()
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, ClaimedBarcodeScannerClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IClaimedBarcodeScanner4")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner4 := IClaimedBarcodeScanner4(outPtr)
        }

        return this.__IClaimedBarcodeScanner4.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IClaimedBarcodeScanner4")) {
            if ((queryResult := this.QueryInterface(IClaimedBarcodeScanner4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedBarcodeScanner4 := IClaimedBarcodeScanner4(outPtr)
        }

        return this.__IClaimedBarcodeScanner4.remove_Closed(token)
    }

    /**
     * Releases exclusive claim to the barcode scanner. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @remarks
     * [Close](../windows.foundation/iclosable_close_811482585.md) methods aren't callable through Visual C++ component extensions (C++/CX) on Windows Runtime class instances where the class implemented [IClosable](../windows.foundation/iclosable.md). Instead, Visual C++ component extensions (C++/CX) code for runtime classes should call the destructor or set the last reference to **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedbarcodescanner.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
