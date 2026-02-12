#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScanner.ahk
#Include .\IBarcodeScanner2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IBarcodeScannerStatics.ahk
#Include .\IBarcodeScannerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\BarcodeScanner.ahk
#Include .\BarcodeScannerStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the barcode scanner device.
 * @remarks
 * This object is created when [GetDefaultAsync](barcodescanner_getdefaultasync_1549573963.md) or [FromIdAsync](barcodescanner_fromidasync_1322863552.md) method completes.
 * 
 * See the [barcode scanner sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/BarcodeScanner) for an example implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScanner extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScanner

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScanner.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the first available barcode scanner.
     * @returns {IAsyncOperation<BarcodeScanner>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!BarcodeScanner.HasProp("__IBarcodeScannerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeScanner")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeScannerStatics.IID)
            BarcodeScanner.__IBarcodeScannerStatics := IBarcodeScannerStatics(factoryPtr)
        }

        return BarcodeScanner.__IBarcodeScannerStatics.GetDefaultAsync()
    }

    /**
     * Creates [BarcodeScanner](barcodescanner.md) object from the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) that identifies a specific barcode scanner, which can be retrieved from the [DeviceId](barcodescanner_deviceid.md) property.
     * @returns {IAsyncOperation<BarcodeScanner>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!BarcodeScanner.HasProp("__IBarcodeScannerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeScanner")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeScannerStatics.IID)
            BarcodeScanner.__IBarcodeScannerStatics := IBarcodeScannerStatics(factoryPtr)
        }

        return BarcodeScanner.__IBarcodeScannerStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the barcode scanners available over the specified connection types
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!BarcodeScanner.HasProp("__IBarcodeScannerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeScanner")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeScannerStatics.IID)
            BarcodeScanner.__IBarcodeScannerStatics := IBarcodeScannerStatics(factoryPtr)
        }

        return BarcodeScanner.__IBarcodeScannerStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the available barcode scanners.
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.getdeviceselector
     */
    static GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        if (!BarcodeScanner.HasProp("__IBarcodeScannerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.BarcodeScanner")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBarcodeScannerStatics2.IID)
            BarcodeScanner.__IBarcodeScannerStatics2 := IBarcodeScannerStatics2(factoryPtr)
        }

        return BarcodeScanner.__IBarcodeScannerStatics2.GetDeviceSelectorWithConnectionTypes(connectionTypes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the barcode scanner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the capabilities of the specified barcode scanner.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.capabilities
     * @type {BarcodeScannerCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Retrieves the video device ID which represents the camera lens associated with the claimed barcode scanner. (Not supported on mobile platforms)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.videodeviceid
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * Occurs when the barcode scanner detects an operation status change.
     * @type {TypedEventHandler<BarcodeScanner, BarcodeScannerStatusUpdatedEventArgs>}
    */
    OnStatusUpdated {
        get {
            if(!this.HasProp("__OnStatusUpdated")){
                this.__OnStatusUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cfc8a053-f611-521a-8ab0-a460e1f7164d}"),
                    BarcodeScanner,
                    BarcodeScannerStatusUpdatedEventArgs
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
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.get_DeviceId()
    }

    /**
     * 
     * @returns {BarcodeScannerCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.get_Capabilities()
    }

    /**
     * Attempts to get an exclusive access to the barcode scanner.
     * @returns {IAsyncOperation<ClaimedBarcodeScanner>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.claimscannerasync
     */
    ClaimScannerAsync() {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.ClaimScannerAsync()
    }

    /**
     * Tests the state of the barcode scanner.
     * @param {Integer} level The specified health check level.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.checkhealthasync
     */
    CheckHealthAsync(level) {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.CheckHealthAsync(level)
    }

    /**
     * Gets the symbologies supported by the claimed barcode scanner.
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.getsupportedsymbologiesasync
     */
    GetSupportedSymbologiesAsync() {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.GetSupportedSymbologiesAsync()
    }

    /**
     * Determines whether the specified symbology is supported by the barcode scanner.
     * @param {Integer} barcodeSymbology The specific barcode symbology.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.issymbologysupportedasync
     */
    IsSymbologySupportedAsync(barcodeSymbology) {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.IsSymbologySupportedAsync(barcodeSymbology)
    }

    /**
     * Retrieves the requested statistics from the barcode scanner.
     * @remarks
     * The result does not contain any duplicate statistics even if the input contains duplicates.
     * @param {IIterable<HSTRING>} statisticsCategories The list of statistics to retrieve.
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS defined statistics.
     * + "M_" retrieves all manufacturer defined statistics.
     * + "name1" and/or "name2" retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and groups names ("name3", "U_", "M_").
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.retrievestatisticsasync
     */
    RetrieveStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.RetrieveStatisticsAsync(statisticsCategories)
    }

    /**
     * Gets the list of profiles supported by the barcode scanner.
     * 
     * > [!IMPORTANT]
     * > This API applies only to Build 10240 and Build 10586 of the Windows Mobile device family (Windows Mobile Extensions for the UWP). This API doesn't apply to the Windows Desktop device family, nor to other device families, nor to builds of Windows Mobile other than 10240 and 10586. When called on an operating system (OS) to which it doesn't apply, the behavior of this API is undefined. For more info about device families, see [Device family extension SDKs and API contracts](/uwp/extension-sdks/).
     * @remarks
     * A barcode scanner can support a number of features in addition to scanning, such as focal length and scan duration. There can be as many as 100 features exposed through settings or properties. To simplify the scanner configuration, the concept of a profile is introduced, which wraps one or more settings defined by the manufacturer. An application developer can query for a list of supported profiles and set a profile.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.getsupportedprofiles
     */
    GetSupportedProfiles() {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.GetSupportedProfiles()
    }

    /**
     * Determines whether the profile is supported.
     * 
     * > [!IMPORTANT]
     * > This API applies only to Build 10240 and Build 10586 of the Windows Mobile device family (Windows Mobile Extensions for the UWP). This API doesn't apply to the Windows Desktop device family, nor to other device families, nor to builds of Windows Mobile other than 10240 and 10586. When called on an operating system (OS) to which it doesn't apply, the behavior of this API is undefined. For more info about device families, see [Device family extension SDKs and API contracts](/uwp/extension-sdks/).
     * @param {HSTRING} profile_ Barcode scanner profile.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.isprofilesupported
     */
    IsProfileSupported(profile_) {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.IsProfileSupported(profile_)
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScanner, BarcodeScannerStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.add_StatusUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        if (!this.HasProp("__IBarcodeScanner")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner := IBarcodeScanner(outPtr)
        }

        return this.__IBarcodeScanner.remove_StatusUpdated(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        if (!this.HasProp("__IBarcodeScanner2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScanner2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScanner2 := IBarcodeScanner2(outPtr)
        }

        return this.__IBarcodeScanner2.get_VideoDeviceId()
    }

    /**
     * Close the barcode scanner session, allowing it to be claimed by another client. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescanner.close
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
