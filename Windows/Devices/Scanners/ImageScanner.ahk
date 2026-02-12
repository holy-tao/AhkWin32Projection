#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageScanner.ahk
#Include .\IImageScannerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the properties of images to scan.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScanner extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageScanner

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageScanner.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of a [ImageScanner](imagescanner.md) object based on a scanners device information ID. This method is required for broker device enumeration.
     * @param {HSTRING} deviceId The device information ID. See [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property.
     * @returns {IAsyncOperation<ImageScanner>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!ImageScanner.HasProp("__IImageScannerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Scanners.ImageScanner")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageScannerStatics.IID)
            ImageScanner.__IImageScannerStatics := IImageScannerStatics(factoryPtr)
        }

        return ImageScanner.__IImageScannerStatics.FromIdAsync(deviceId)
    }

    /**
     * Returns the class selection string that apps can use to enumerate scanner devices. This method is required for the brokered device enumeration.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!ImageScanner.HasProp("__IImageScannerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Scanners.ImageScanner")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageScannerStatics.IID)
            ImageScanner.__IImageScannerStatics := IImageScannerStatics(factoryPtr)
        }

        return ImageScanner.__IImageScannerStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the PnP device identifier of this scanner device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the default scan source chosen for this scanner device.
     * @remarks
     * By default, the scan source will be selected from the device in this order of priority:
     * + 1. Auto
     * + 2. Flatbed
     * + 3. Feeder
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.defaultscansource
     * @type {Integer} 
     */
    DefaultScanSource {
        get => this.get_DefaultScanSource()
    }

    /**
     * Gets and sets the scan settings of the flatbed scan unit, like scan resolution and color mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.flatbedconfiguration
     * @type {ImageScannerFlatbedConfiguration} 
     */
    FlatbedConfiguration {
        get => this.get_FlatbedConfiguration()
    }

    /**
     * Gets or sets the scan settings of the feeder scan unit, like page size, orientation, and scan resolution.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.feederconfiguration
     * @type {ImageScannerFeederConfiguration} 
     */
    FeederConfiguration {
        get => this.get_FeederConfiguration()
    }

    /**
     * Gets and sets the scan settings of the auto-configured scan unit, like the file format, including compression to deliver the scanned data in. This property is ignored if the scanner is not capable of auto-configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.autoconfiguration
     * @type {ImageScannerAutoConfiguration} 
     */
    AutoConfiguration {
        get => this.get_AutoConfiguration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultScanSource() {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.get_DefaultScanSource()
    }

    /**
     * Determines if the specified scan source is available on the scanner.
     * @param {Integer} value The scan source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.isscansourcesupported
     */
    IsScanSourceSupported(value) {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.IsScanSourceSupported(value)
    }

    /**
     * 
     * @returns {ImageScannerFlatbedConfiguration} 
     */
    get_FlatbedConfiguration() {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.get_FlatbedConfiguration()
    }

    /**
     * 
     * @returns {ImageScannerFeederConfiguration} 
     */
    get_FeederConfiguration() {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.get_FeederConfiguration()
    }

    /**
     * 
     * @returns {ImageScannerAutoConfiguration} 
     */
    get_AutoConfiguration() {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.get_AutoConfiguration()
    }

    /**
     * Determines if the specified scan source supports scan preview.
     * @param {Integer} scanSource The scan source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.ispreviewsupported
     */
    IsPreviewSupported(scanSource) {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.IsPreviewSupported(scanSource)
    }

    /**
     * Scans one image from the specified scan source and applies the lowest scan resolution with the selected image file format.
     * @remarks
     * Attempting to preview from a feeder that supports preview but is empty at the time will result in a successful completion of the async call. The app should check for the returned [ImageScannerPreviewResult.Succeeded](imagescannerpreviewresult.md) result before attempting to read data from the stream, especially when scanning from the feeder.
     * @param {Integer} scanSource The image scan source.
     * @param {IRandomAccessStream} targetStream The scanned image file.
     * @returns {IAsyncOperation<ImageScannerPreviewResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.scanpreviewtostreamasync
     */
    ScanPreviewToStreamAsync(scanSource, targetStream) {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.ScanPreviewToStreamAsync(scanSource, targetStream)
    }

    /**
     * Starts a scan job with the specified scan source and writes one or multiple images to one multi-page file like TIFF, XPS, and PDF; or one or multiple single-page files like DIB, PNG, JPG, and TIFF to the specified folder location. Returns the progress of the scan.
     * @remarks
     * The files are named using temporary names, with a standard file extension that depends on the file format type.
     * 
     * 
     * 
     * > [!NOTE]
     * > In UWP app, when this method is invoked, the app must be visible and running in the foreground.
     * 
     * When the app cancels the async call, it initiates a cancellation request of the current scan job. There is no guarantee that if the app cancels the async call that the scan job will be canceled. If the cancellation goes through, the scanner may stop for these reasons:
     * 
     * 
     * + It takes a few seconds before the scanner stops scanning.
     * + It stops only when it runs out of paper (for a feeder acquisition).
     * + It completes running the scan head to the end of the bed and then fully returns the scan head to its parked location (for a flatbed acquisition).
     * 
     * 
     * Internally the async cancelation will flag the current WIA 2.0 scan job as canceled from within the app. If the WIA device makes the next callback to the WIA service the job cancellation may or may not be successfully communicated to the WIA driver. But, even if the WIA driver receives the cancel request from one of its callbacks there is no guarantee that the driver can successfully stop the scanner from scanning, immediately or after any predictable period of time.
     * 
     * Here's the list of WIA specific HRESULT error codes as well as standard COM HRESULT error codes this function returns. 
     * 
     * > [!NOTE]
     * > (the API will call WinRTOriginateError and/or OriginateErrorWithResourceString (all specific WIA errors will have localizable error descriptions) for the WIA specific failure HRESULTs):
     * 
     * <table>
     *    <tr><td>WIA_ERROR_GENERAL_ERROR</td><td>WIA_ERROR_PAPER_JAM</td><td>WIA_ERROR_PAPER_EMPTY</td></tr>
     *    <tr><td>WIA_ERROR_PAPER_PROBLEM</td><td>WIA_ERROR_OFFLINE</td><td>WIA_ERROR_BUSY</td></tr>
     *    <tr><td>WIA_ERROR_WARMING_UP</td><td>WIA_ERROR_USER_INTERVENTION</td><td>WIA_ERROR_ITEM_DELETED</td></tr>
     *    <tr><td>WIA_ERROR_DEVICE_COMMUNICATION</td><td>WIA_ERROR_INVALID_COMMAND</td><td>WIA_ERROR_INCORRECT_HARDWARE_SETTING</td></tr>
     *    <tr><td>WIA_ERROR_DEVICE_LOCKED</td><td>WIA_ERROR_EXCEPTION_IN_DRIVER</td><td>WIA_ERROR_INVALID_DRIVER_RESPONSE</td></tr>
     *    <tr><td>WIA_ERROR_COVER_OPEN</td><td>WIA_ERROR_LAMP_OFF</td><td>WIA_ERROR_MULTI_FEED</td></tr>
     * </table>
     * 
     * There are two special cases:
     * 
     * 
     * + The WIA’s HRESULT of S_FALSE will be translated to a canceled async call (AsyncStatus.Canceled).
     * + The WIA’s WIA_ERROR_PAPER_EMPTY will be translated by this API to a successful return (AsyncStatus.Completed) with an empty list of files (IVectorView.Size set to 0).
     * To prevent orphan files, this method deletes any remaining orphan files used to transfer images upon failure, before the failure occurred. The method will save the transfer files as temporary files and keep them until the scan job completes. The app must instruct the user to rescan the document.
     * @param {Integer} scanSource The image scan source.
     * @param {StorageFolder} storageFolder_ The target folder location of the scanned file.
     * @returns {IAsyncOperationWithProgress<ImageScannerScanResult, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescanner.scanfilestofolderasync
     */
    ScanFilesToFolderAsync(scanSource, storageFolder_) {
        if (!this.HasProp("__IImageScanner")) {
            if ((queryResult := this.QueryInterface(IImageScanner.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageScanner := IImageScanner(outPtr)
        }

        return this.__IImageScanner.ScanFilesToFolderAsync(scanSource, storageFolder_)
    }

;@endregion Instance Methods
}
