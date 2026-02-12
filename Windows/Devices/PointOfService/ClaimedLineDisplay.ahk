#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedLineDisplay.ahk
#Include .\IClaimedLineDisplay2.ahk
#Include .\IClaimedLineDisplay3.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IClaimedLineDisplayStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ClaimedLineDisplay.ahk
#Include .\LineDisplayStatusUpdatedEventArgs.ahk
#Include .\ClaimedLineDisplayClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a claimed line display device.
 * @remarks
 * This object can be constructed directly, or by using [LineDisplay.ClaimAsync](linedisplay_claimasync_1760840245.md). Unlike other peripherals, the EnableAsync() method has been removed for line displays. Instead, the device is implicitly enabled whenever commands are sent that require the line display to be in an enabled state.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedLineDisplay extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedLineDisplay

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedLineDisplay.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [LineDisplay](linedisplay.md) object from the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) that identifies a specific line display, which can be retrieved from the [DeviceId](barcodescanner_deviceid.md) property.
     * @returns {IAsyncOperation<ClaimedLineDisplay>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!ClaimedLineDisplay.HasProp("__IClaimedLineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.ClaimedLineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClaimedLineDisplayStatics.IID)
            ClaimedLineDisplay.__IClaimedLineDisplayStatics := IClaimedLineDisplayStatics(factoryPtr)
        }

        return ClaimedLineDisplay.__IClaimedLineDisplayStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the line displays available over the specified connection types
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!ClaimedLineDisplay.HasProp("__IClaimedLineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.ClaimedLineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClaimedLineDisplayStatics.IID)
            ClaimedLineDisplay.__IClaimedLineDisplayStatics := IClaimedLineDisplayStatics(factoryPtr)
        }

        return ClaimedLineDisplay.__IClaimedLineDisplayStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the available line displays.
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.getdeviceselector
     */
    static GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        if (!ClaimedLineDisplay.HasProp("__IClaimedLineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.ClaimedLineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClaimedLineDisplayStatics.IID)
            ClaimedLineDisplay.__IClaimedLineDisplayStatics := IClaimedLineDisplayStatics(factoryPtr)
        }

        return ClaimedLineDisplay.__IClaimedLineDisplayStatics.GetDeviceSelectorWithConnectionTypes(connectionTypes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the capabilities of the claimed line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.capabilities
     * @type {LineDisplayCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Gets the physical device name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.physicaldevicename
     * @type {HSTRING} 
     */
    PhysicalDeviceName {
        get => this.get_PhysicalDeviceName()
    }

    /**
     * Gets the physical device description.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.physicaldevicedescription
     * @type {HSTRING} 
     */
    PhysicalDeviceDescription {
        get => this.get_PhysicalDeviceDescription()
    }

    /**
     * Gets the device control description of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.devicecontroldescription
     * @type {HSTRING} 
     */
    DeviceControlDescription {
        get => this.get_DeviceControlDescription()
    }

    /**
     * Gets the device control version number of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.devicecontrolversion
     * @type {HSTRING} 
     */
    DeviceControlVersion {
        get => this.get_DeviceControlVersion()
    }

    /**
     * Gets the service version number of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.deviceserviceversion
     * @type {HSTRING} 
     */
    DeviceServiceVersion {
        get => this.get_DeviceServiceVersion()
    }

    /**
     * Gets the default device window of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.defaultwindow
     * @type {LineDisplayWindow} 
     */
    DefaultWindow {
        get => this.get_DefaultWindow()
    }

    /**
     * Gets the screen sizes supported by the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.supportedscreensizesincharacters
     * @type {IVectorView<SIZE>} 
     */
    SupportedScreenSizesInCharacters {
        get => this.get_SupportedScreenSizesInCharacters()
    }

    /**
     * Gets the maximum bitmap size.
     * @remarks
     * When bitmaps are supported (when [LineDisplayCapabilities.CanDisplayBitmaps](LineDisplayCapabilities_CanDisplayBitmaps.md) is True) this read-only property describes the size of the screen that can display bitmaps as number of horizontal and vertical pixels. The maximum number of pixels in each direction is 65,535. When bitmaps are not supported by the device ([LineDisplayCapabilities.CanDisplayBitmaps](LineDisplayCapabilities_CanDisplayBitmaps.md) is False) the value of this property is {0, 0}.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.maxbitmapsizeinpixels
     * @type {SIZE} 
     */
    MaxBitmapSizeInPixels {
        get => this.get_MaxBitmapSizeInPixels()
    }

    /**
     * Gets the character sets supported by the line display.
     * @remarks
     * Each character set is identified by a number which may be either a device-specific character set number or a code page, including 997 (Unicode), ASCII (998) and ANSI (999).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.supportedcharactersets
     * @type {IVectorView<Integer>} 
     */
    SupportedCharacterSets {
        get => this.get_SupportedCharacterSets()
    }

    /**
     * Gets the line display's custom glyph list, if the feature is supported.
     * @remarks
     * When CanDisplayCustomGlyphs is True this property holds the LineDisplayCustomGlyphs object for this line display device. When Capabilities.CanDisplayCustomGlyphs is set to False this property is set to null.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.customglyphs
     * @type {LineDisplayCustomGlyphs} 
     */
    CustomGlyphs {
        get => this.get_CustomGlyphs()
    }

    /**
     * Occurs when a claimed line display claimed is claimed by another app with [LineDisplay.ClaimAsync](linedisplay_claimasync_1760840245.md).
     * @type {TypedEventHandler<ClaimedLineDisplay, IInspectable>}
    */
    OnReleaseDeviceRequested {
        get {
            if(!this.HasProp("__OnReleaseDeviceRequested")){
                this.__OnReleaseDeviceRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c997782b-46e9-5d92-ac84-ee9d7d073ab5}"),
                    ClaimedLineDisplay,
                    IInspectable
                )
                this.__OnReleaseDeviceRequestedToken := this.add_ReleaseDeviceRequested(this.__OnReleaseDeviceRequested.iface)
            }
            return this.__OnReleaseDeviceRequested
        }
    }

    /**
     * Notifies the application that there is a change in the power status of the line display.
     * @remarks
     * The event values are the same as the values returned by [CheckPowerStatusAsync](claimedlinedisplay_checkpowerstatusasync_1107655958.md).
     * @type {TypedEventHandler<ClaimedLineDisplay, LineDisplayStatusUpdatedEventArgs>}
    */
    OnStatusUpdated {
        get {
            if(!this.HasProp("__OnStatusUpdated")){
                this.__OnStatusUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{25d178ff-3069-536c-a0c2-88e0250e8a29}"),
                    ClaimedLineDisplay,
                    LineDisplayStatusUpdatedEventArgs
                )
                this.__OnStatusUpdatedToken := this.add_StatusUpdated(this.__OnStatusUpdated.iface)
            }
            return this.__OnStatusUpdated
        }
    }

    /**
     * Event that is raised when the **ClaimedLineDisplay** is closed.
     * @remarks
     * When an app is suspended, all **ClaimedLineDisplay** objects are closed. This event can be useful to determine when line display connections need to be re-established.
     * @type {TypedEventHandler<ClaimedLineDisplay, ClaimedLineDisplayClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{53ab62d6-b038-5261-a934-cc206f1756e6}"),
                    ClaimedLineDisplay,
                    ClaimedLineDisplayClosedEventArgs
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
        if(this.HasProp("__OnReleaseDeviceRequestedToken")) {
            this.remove_ReleaseDeviceRequested(this.__OnReleaseDeviceRequestedToken)
            this.__OnReleaseDeviceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnStatusUpdatedToken")) {
            this.remove_StatusUpdated(this.__OnStatusUpdatedToken)
            this.__OnStatusUpdated.iface.Dispose()
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
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_DeviceId()
    }

    /**
     * 
     * @returns {LineDisplayCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_Capabilities()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhysicalDeviceName() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_PhysicalDeviceName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhysicalDeviceDescription() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_PhysicalDeviceDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceControlDescription() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_DeviceControlDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceControlVersion() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_DeviceControlVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceServiceVersion() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_DeviceServiceVersion()
    }

    /**
     * 
     * @returns {LineDisplayWindow} 
     */
    get_DefaultWindow() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.get_DefaultWindow()
    }

    /**
     * Retains an app's claim on a line display device after it has been claimed by another app with [LineDisplay.ClaimAsync](linedisplay_claimasync_1760840245.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.retaindevice
     */
    RetainDevice() {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.RetainDevice()
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedLineDisplay, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.add_ReleaseDeviceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReleaseDeviceRequested(token) {
        if (!this.HasProp("__IClaimedLineDisplay")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay := IClaimedLineDisplay(outPtr)
        }

        return this.__IClaimedLineDisplay.remove_ReleaseDeviceRequested(token)
    }

    /**
     * Retrieves the requested statistics from the line display.
     * @param {IIterable<HSTRING>} statisticsCategories The list of statistics to retrieve.
     * + An empty list retrieves all statistics.
     * + To retrieve specific statistics defined by the manufacturer, include the manufacturer-specified statistic names such as "name1" or "name2".
     * + Include [LineDisplayStatisticsCategorySelector.ManufacturerStatistics](linedisplaystatisticscategoryselector_manufacturerstatistics.md) and [LineDisplayStatisticsCategorySelector.UnifiedPosStatistics](linedisplaystatisticscategoryselector_unifiedposstatistics.md) to retrieve manufacturer-specific and UnifiedPOS statistics respectively.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.getstatisticsasync
     */
    GetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.GetStatisticsAsync(statisticsCategories)
    }

    /**
     * Gets the device's health state asynchronously.
     * @remarks
     * This feature behaves identically to corresponding features in the other POS peripherals, and support for this operation is required by the UPOS standard.
     * @param {Integer} level The specified health check level.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.checkhealthasync
     */
    CheckHealthAsync(level) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.CheckHealthAsync(level)
    }

    /**
     * Gets the current power status of the device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.checkpowerstatusasync
     */
    CheckPowerStatusAsync() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.CheckPowerStatusAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedLineDisplay, LineDisplayStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.add_StatusUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.remove_StatusUpdated(token)
    }

    /**
     * 
     * @returns {IVectorView<SIZE>} 
     */
    get_SupportedScreenSizesInCharacters() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.get_SupportedScreenSizesInCharacters()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxBitmapSizeInPixels() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.get_MaxBitmapSizeInPixels()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCharacterSets() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.get_SupportedCharacterSets()
    }

    /**
     * 
     * @returns {LineDisplayCustomGlyphs} 
     */
    get_CustomGlyphs() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.get_CustomGlyphs()
    }

    /**
     * Gets the attributes of the line display.
     * @returns {LineDisplayAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.getattributes
     */
    GetAttributes() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.GetAttributes()
    }

    /**
     * Updates the device attributes.
     * @param {LineDisplayAttributes} attributes The updated attributes to be applied to the device.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.tryupdateattributesasync
     */
    TryUpdateAttributesAsync(attributes) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TryUpdateAttributesAsync(attributes)
    }

    /**
     * Attempts to asynchronously set a descriptor using the specified attribute.
     * @remarks
     * [LineDisplayCapabilities.SupportedDescriptors](LineDisplayCapabilities_SupportedDescriptors.md) must be greater than zero for this method to be successfully executed.
     * @param {Integer} descriptor The descriptor to be set. Must have a value between 0 and [LineDisplayCapabilities.SupportedDescriptors](LineDisplayCapabilities_SupportedDescriptors.md) - 1.
     * @param {Integer} descriptorState The state to give to the descriptor.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.trysetdescriptorasync
     */
    TrySetDescriptorAsync(descriptor, descriptorState) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TrySetDescriptorAsync(descriptor, descriptorState)
    }

    /**
     * Attempts to asynchronously clear all descriptions.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.trycleardescriptorsasync
     */
    TryClearDescriptorsAsync() {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TryClearDescriptorsAsync()
    }

    /**
     * Attempts to asynchronously create a [LineDisplayWindow](linedisplaywindow.md).
     * @remarks
     * When [LineDisplayCapabilities.SupportedWindows](linedisplaycapabilities_supportedwindows.md) is greater than 0 this method can be called to create a new [LineDisplayWindow](linedisplaywindow.md) object representing a new window for the device. The new window is not automatically set as the current window when it is created, to set that window as current set the [LineDisplayAttributes.CurrentWindow](linedisplayattributes_currentwindow.md) property to point to this [LineDisplayWindow](linedisplaywindow.md) object, or on that same [LineDisplayWindow](linedisplaywindow.md) object call its [TryRefreshAsync](linedisplaywindow_tryrefreshasync_1864090804.md) method.
     * 
     * Calling this method when [LineDisplayCapabilities.SupportedWindows](linedisplaycapabilities_supportedwindows.md) is 0 will result in an exception.
     * 
     * The window size must be at least as large as the viewport size, and it may be larger than its viewport in at most one direction. When [LineDisplayCapabilities.IsVerticalMarqueeSupported](linedisplayCapabilities_isverticalmarqueesupported.md) is True, the window may be larger than the viewport in the vertical dimension. When [LineDisplayCapabilities.IsHorizontalMarqueeSupported](linedisplaycapabilities_ishorizontalmarqueesupported.md) is True, the window may be larger than the viewport in the horizontal dimension.
     * @param {RECT} viewport The viewport’s origin device row, origin device column, width in rows and height in columns.
     * @param {SIZE} windowSize The numbers of rows and the number of columns in the window.
     * @returns {IAsyncOperation<LineDisplayWindow>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.trycreatewindowasync
     */
    TryCreateWindowAsync(viewport, windowSize) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TryCreateWindowAsync(viewport, windowSize)
    }

    /**
     * Attempts to asynchronously store a bitmap image from a [StorageFile](../windows.storage/storagefile.md) for later display on the line display device.
     * @remarks
     * - The bitmap [StorageFile](../windows.storage/storagefile.md) must be backed by a local file. If it is created from a stream, a URI or another source this method will throw an exception.
     * - Calling this method when [LineDisplayCapabiliaties.CanDisplayBitmaps](LineDisplayCapabilities_CanDisplayBitmaps.md) is False will result in an exception.
     * - Up to 100 bitmaps can be stored using this method. Attempting to store more than 100 bitmaps will result in an exception. Delete unused bitmaps using [LineDisplayStoredBitmap.TryDeleteAsync](linedisplaystoredbitmap_trydeleteasync_41251962.md).
     * @param {StorageFile} bitmap_ A [StorageFile](../windows.storage/storagefile.md) that represents a local bitmap file. All line displays support black and white uncompressed Windows bitmaps. Check device specifications for other supported formats.
     * @returns {IAsyncOperation<LineDisplayStoredBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.trystorestoragefilebitmapasync
     */
    TryStoreStorageFileBitmapAsync(bitmap_) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TryStoreStorageFileBitmapAsync(bitmap_)
    }

    /**
     * Attempts to asynchronously store a bitmap image from a [StorageFile](../windows.storage/storagefile.md) for later display on the line display device.
     * @remarks
     * - The bitmap [StorageFile](../windows.storage/storagefile.md) must be backed by a local file. If it is created from a stream, a URI or another source this method will throw an exception.
     * - Calling this method when [LineDisplayCapabiliaties.CanDisplayBitmaps](LineDisplayCapabilities_CanDisplayBitmaps.md) is False will result in an exception.
     * - Up to 100 bitmaps can be stored using this method. Attempting to store more than 100 bitmaps will result in an exception. Delete unused bitmaps using [LineDisplayStoredBitmap.TryDeleteAsync](linedisplaystoredbitmap_trydeleteasync_41251962.md).
     * - Passing a bitmap width greater than [ClaimedLineDisplay.MaxBitmapSizeInPixels](claimedlinedisplay_maxbitmapsizeinpixels.md) will result in an exception.
     * @param {StorageFile} bitmap_ A [StorageFile](../windows.storage/storagefile.md) that represents a local bitmap file. All line displays support black and white uncompressed Windows bitmaps. Check device specifications for other supported formats.
     * @param {Integer} horizontalAlignment_ Determines how the bitmap will be horizontally aligned relative to its originating character cell.
     * @param {Integer} verticalAlignment_ Determines how the bitmap will be vertically aligned relative to its originating character cell.
     * @returns {IAsyncOperation<LineDisplayStoredBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.trystorestoragefilebitmapasync
     */
    TryStoreStorageFileBitmapWithAlignmentAsync(bitmap_, horizontalAlignment_, verticalAlignment_) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TryStoreStorageFileBitmapWithAlignmentAsync(bitmap_, horizontalAlignment_, verticalAlignment_)
    }

    /**
     * Attempts to asynchronously store a bitmap image from a [StorageFile](../windows.storage/storagefile.md) for later display on the line display device.
     * @remarks
     * - The bitmap [StorageFile](../windows.storage/storagefile.md) must be backed by a local file. If it is created from a stream, a URI or another source this method will throw an exception.
     * - Calling this method when [LineDisplayCapabiliaties.CanDisplayBitmaps](LineDisplayCapabilities_CanDisplayBitmaps.md) is False will result in an exception.
     * - Up to 100 bitmaps can be stored using this method. Attempting to store more than 100 bitmaps will result in an exception. Delete unused bitmaps using [LineDisplayStoredBitmap.TryDeleteAsync](linedisplaystoredbitmap_trydeleteasync_41251962.md).
     * @param {StorageFile} bitmap_ A [StorageFile](../windows.storage/storagefile.md) that represents a local bitmap file. All line displays support black and white uncompressed Windows bitmaps. Check device specifications for other supported formats.
     * @param {Integer} horizontalAlignment_ 
     * @param {Integer} verticalAlignment_ 
     * @param {Integer} widthInPixels 
     * @returns {IAsyncOperation<LineDisplayStoredBitmap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.trystorestoragefilebitmapasync
     */
    TryStoreStorageFileBitmapWithAlignmentAndWidthAsync(bitmap_, horizontalAlignment_, verticalAlignment_, widthInPixels) {
        if (!this.HasProp("__IClaimedLineDisplay2")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay2 := IClaimedLineDisplay2(outPtr)
        }

        return this.__IClaimedLineDisplay2.TryStoreStorageFileBitmapWithAlignmentAndWidthAsync(bitmap_, horizontalAlignment_, verticalAlignment_, widthInPixels)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedLineDisplay, ClaimedLineDisplayClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IClaimedLineDisplay3")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay3 := IClaimedLineDisplay3(outPtr)
        }

        return this.__IClaimedLineDisplay3.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IClaimedLineDisplay3")) {
            if ((queryResult := this.QueryInterface(IClaimedLineDisplay3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedLineDisplay3 := IClaimedLineDisplay3(outPtr)
        }

        return this.__IClaimedLineDisplay3.remove_Closed(token)
    }

    /**
     * Close the line display session. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedlinedisplay.close
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
