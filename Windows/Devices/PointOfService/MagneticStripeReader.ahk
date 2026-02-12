#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMagneticStripeReaderStatics2.ahk
#Include .\IMagneticStripeReaderStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MagneticStripeReader.ahk
#Include .\MagneticStripeReaderStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the magnetic stripe reader device.
 * @remarks
 * This object is created when [GetDefaultAsync](magneticstripereader_getdefaultasync_1549573963.md) or [FromIdAsync](magneticstripereader_fromidasync_1322863552.md) method completes.
 * 
 * See the [magnetic stripe reader sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/MagneticStripeReader) for an example implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagneticStripeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagneticStripeReader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns an Advanced Query Syntax (AQS) string that is used to enumerate available magnetic stripe readers.
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.getdeviceselector
     */
    static GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        if (!MagneticStripeReader.HasProp("__IMagneticStripeReaderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderStatics2.IID)
            MagneticStripeReader.__IMagneticStripeReaderStatics2 := IMagneticStripeReaderStatics2(factoryPtr)
        }

        return MagneticStripeReader.__IMagneticStripeReaderStatics2.GetDeviceSelectorWithConnectionTypes(connectionTypes)
    }

    /**
     * Returns the first magnetic stripe reader found.
     * @returns {IAsyncOperation<MagneticStripeReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!MagneticStripeReader.HasProp("__IMagneticStripeReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderStatics.IID)
            MagneticStripeReader.__IMagneticStripeReaderStatics := IMagneticStripeReaderStatics(factoryPtr)
        }

        return MagneticStripeReader.__IMagneticStripeReaderStatics.GetDefaultAsync()
    }

    /**
     * Creates a [MagneticStripeReader](magneticstripereader.md) object from [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) that identifies a specific magnetic stripe reader, which can be retrieved from the [DeviceId](magneticstripereader_deviceid.md) property.
     * @returns {IAsyncOperation<MagneticStripeReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!MagneticStripeReader.HasProp("__IMagneticStripeReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderStatics.IID)
            MagneticStripeReader.__IMagneticStripeReaderStatics := IMagneticStripeReaderStatics(factoryPtr)
        }

        return MagneticStripeReader.__IMagneticStripeReaderStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the magnetic stripe readers available over the specified connection types
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!MagneticStripeReader.HasProp("__IMagneticStripeReaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderStatics.IID)
            MagneticStripeReader.__IMagneticStripeReaderStatics := IMagneticStripeReaderStatics(factoryPtr)
        }

        return MagneticStripeReader.__IMagneticStripeReaderStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the magnetic stripe reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the capabilities of the magnetic stripe reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.capabilities
     * @type {MagneticStripeReaderCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Gets the card types supported by the magnetic stripe reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.supportedcardtypes
     */
    SupportedCardTypes {
        get => this.get_SupportedCardTypes()
    }

    /**
     * Device authentication protocol supported by the magnetic stripe reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.deviceauthenticationprotocol
     * @type {Integer} 
     */
    DeviceAuthenticationProtocol {
        get => this.get_DeviceAuthenticationProtocol()
    }

    /**
     * Occurs when the device detects an operation status change.
     * @type {TypedEventHandler<MagneticStripeReader, MagneticStripeReaderStatusUpdatedEventArgs>}
    */
    OnStatusUpdated {
        get {
            if(!this.HasProp("__OnStatusUpdated")){
                this.__OnStatusUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{722d8bfa-e10e-548d-af29-28dd906f6fc9}"),
                    MagneticStripeReader,
                    MagneticStripeReaderStatusUpdatedEventArgs
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
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.get_DeviceId()
    }

    /**
     * 
     * @returns {MagneticStripeReaderCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.get_Capabilities()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_SupportedCardTypes(value) {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.get_SupportedCardTypes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceAuthenticationProtocol() {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.get_DeviceAuthenticationProtocol()
    }

    /**
     * Tests the health of the magnetic stripe reader.
     * @param {Integer} level The specific health check level.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.checkhealthasync
     */
    CheckHealthAsync(level) {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.CheckHealthAsync(level)
    }

    /**
     * Attempts to get an exclusive access to the magnetic stripe reader.
     * @returns {IAsyncOperation<ClaimedMagneticStripeReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.claimreaderasync
     */
    ClaimReaderAsync() {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.ClaimReaderAsync()
    }

    /**
     * Retrieves the requested statistics from the magnetic stripe reader.
     * @remarks
     * The result does not contain any duplicate statistics even if the input contains duplicates.
     * @param {IIterable<HSTRING>} statisticsCategories The list of statistics to retrieve.
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS defined statistics.
     * + "M_" retrieves all manufacturer defined statistics.
     * + "name1" and/or "name2" retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and groups names ("name3", "U_", "M_").
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.retrievestatisticsasync
     */
    RetrieveStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.RetrieveStatisticsAsync(statisticsCategories)
    }

    /**
     * Gets the error reporting type the application wants to receive.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.geterrorreportingtype
     */
    GetErrorReportingType() {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.GetErrorReportingType()
    }

    /**
     * 
     * @param {TypedEventHandler<MagneticStripeReader, MagneticStripeReaderStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.add_StatusUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        if (!this.HasProp("__IMagneticStripeReader")) {
            if ((queryResult := this.QueryInterface(IMagneticStripeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagneticStripeReader := IMagneticStripeReader(outPtr)
        }

        return this.__IMagneticStripeReader.remove_StatusUpdated(token)
    }

    /**
     * Close the magnetic stripe reader session. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereader.close
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
