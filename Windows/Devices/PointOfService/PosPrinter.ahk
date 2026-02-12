#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinter.ahk
#Include .\IPosPrinter2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IPosPrinterStatics.ahk
#Include .\IPosPrinterStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PosPrinter.ahk
#Include .\PosPrinterStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a point-of-service printer.
 * @remarks
 * To get a PosPrinter object, use the [FromIdAsync](posprinter_fromidasync_1322863552.md) or [GetDefaultAsync](posprinter_getdefaultasync_1549573963.md) static methods.
 * 
 * See the [POS printer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/PosPrinter) for an example implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default paired or locally-connected printer.
     * @remarks
     * The app manifest must include the PointofService device capability. If the manifest omits this capability, this method returns null and no exception is generated.
     * @returns {IAsyncOperation<PosPrinter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!PosPrinter.HasProp("__IPosPrinterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterStatics.IID)
            PosPrinter.__IPosPrinterStatics := IPosPrinterStatics(factoryPtr)
        }

        return PosPrinter.__IPosPrinterStatics.GetDefaultAsync()
    }

    /**
     * Creates a [PosPrinter](posprinter.md) object for point-of-service printer with the specified [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @remarks
     * The app package manifest must include the PointofService device capability. If the manifest omits this capability, this method returns null and no exception is generated.
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) that identifies a specific point-of-service printer.
     * @returns {IAsyncOperation<PosPrinter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!PosPrinter.HasProp("__IPosPrinterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterStatics.IID)
            PosPrinter.__IPosPrinterStatics := IPosPrinterStatics(factoryPtr)
        }

        return PosPrinter.__IPosPrinterStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the point-of-service printers available over the specified connection types
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!PosPrinter.HasProp("__IPosPrinterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterStatics.IID)
            PosPrinter.__IPosPrinterStatics := IPosPrinterStatics(factoryPtr)
        }

        return PosPrinter.__IPosPrinterStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the available point-of-service printers.
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.getdeviceselector
     */
    static GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        if (!PosPrinter.HasProp("__IPosPrinterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPosPrinterStatics2.IID)
            PosPrinter.__IPosPrinterStatics2 := IPosPrinterStatics2(factoryPtr)
        }

        return PosPrinter.__IPosPrinterStatics2.GetDeviceSelectorWithConnectionTypes(connectionTypes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier of the point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the capabilities of the point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.capabilities
     * @type {PosPrinterCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Gets the list of character sets that the point-of-service printer supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.supportedcharactersets
     * @type {IVectorView<Integer>} 
     */
    SupportedCharacterSets {
        get => this.get_SupportedCharacterSets()
    }

    /**
     * Gets the fonts and typefaces that the point-of-service printer supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.supportedtypefaces
     * @type {IVectorView<HSTRING>} 
     */
    SupportedTypeFaces {
        get => this.get_SupportedTypeFaces()
    }

    /**
     * Gets the current status of the power and availability of the point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.status
     * @type {PosPrinterStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the barcode symbologies that the point-of-service printer supports.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.supportedbarcodesymbologies
     * @type {IVectorView<Integer>} 
     */
    SupportedBarcodeSymbologies {
        get => this.get_SupportedBarcodeSymbologies()
    }

    /**
     * Occurs when the status of the power or availability of the point-of-service printer changes.
     * @type {TypedEventHandler<PosPrinter, PosPrinterStatusUpdatedEventArgs>}
    */
    OnStatusUpdated {
        get {
            if(!this.HasProp("__OnStatusUpdated")){
                this.__OnStatusUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{20b0c66a-5f41-5a32-b45a-344f12e70a34}"),
                    PosPrinter,
                    PosPrinterStatusUpdatedEventArgs
                )
                this.__OnStatusUpdatedToken := this.add_StatusUpdated(this.__OnStatusUpdated.iface)
            }
            return this.__OnStatusUpdated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStatusUpdatedToken")) {
            this.remove_StatusUpdated(this.__OnStatusUpdatedToken)
            this.__OnStatusUpdated.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.get_DeviceId()
    }

    /**
     * 
     * @returns {PosPrinterCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.get_Capabilities()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCharacterSets() {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.get_SupportedCharacterSets()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedTypeFaces() {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.get_SupportedTypeFaces()
    }

    /**
     * 
     * @returns {PosPrinterStatus} 
     */
    get_Status() {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.get_Status()
    }

    /**
     * Claims the point-of-service printer for use, and gets an instance of the [ClaimedPosPrinter](claimedposprinter.md) class for the point-of-service printer.
     * @remarks
     * The claim is cooperatively managed, so multiple concurrent apps can negotiate which app owns the claim.
     * @returns {IAsyncOperation<ClaimedPosPrinter>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.claimprinterasync
     */
    ClaimPrinterAsync() {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.ClaimPrinterAsync()
    }

    /**
     * Gets the health state of the point-of-service printer asynchronously.
     * @param {Integer} level The type of health check that you want to perform for the point-of-service printer. Only level POSInternal(1) should be used, as any other [UnifiedPosHealthCheckLevel](unifiedposhealthchecklevel.md) levels will result in an error.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.checkhealthasync
     */
    CheckHealthAsync(level) {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.CheckHealthAsync(level)
    }

    /**
     * Gets the specified statistics from the point-of-service printer.
     * @param {IIterable<HSTRING>} statisticsCategories The list of statistics to retrieve.
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS defined statistics.
     * + "M_" retrieves all manufacturer defined statistics.
     * + "name1" and/or "name2" retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and groups names ("name3", "U_", "M_").
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.getstatisticsasync
     */
    GetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.GetStatisticsAsync(statisticsCategories)
    }

    /**
     * 
     * @param {TypedEventHandler<PosPrinter, PosPrinterStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.add_StatusUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        if (!this.HasProp("__IPosPrinter")) {
            if ((queryResult := this.QueryInterface(IPosPrinter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter := IPosPrinter(outPtr)
        }

        return this.__IPosPrinter.remove_StatusUpdated(token)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBarcodeSymbologies() {
        if (!this.HasProp("__IPosPrinter2")) {
            if ((queryResult := this.QueryInterface(IPosPrinter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter2 := IPosPrinter2(outPtr)
        }

        return this.__IPosPrinter2.get_SupportedBarcodeSymbologies()
    }

    /**
     * Gets the specified font property from the point-of-service printers.
     * @param {HSTRING} typeface The typeface of the font property to retrieve.
     * @returns {PosPrinterFontProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.getfontproperty
     */
    GetFontProperty(typeface) {
        if (!this.HasProp("__IPosPrinter2")) {
            if ((queryResult := this.QueryInterface(IPosPrinter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinter2 := IPosPrinter2(outPtr)
        }

        return this.__IPosPrinter2.GetFontProperty(typeface)
    }

    /**
     * Close the POS printer session. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinter.close
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
