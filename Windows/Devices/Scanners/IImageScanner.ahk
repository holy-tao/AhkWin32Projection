#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ImageScannerFlatbedConfiguration.ahk
#Include .\ImageScannerFeederConfiguration.ahk
#Include .\ImageScannerAutoConfiguration.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ImageScannerPreviewResult.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\ImageScannerScanResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Configures the file format when a scanner input source transfers acquired image data to the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.iimagescannerformatconfiguration
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class IImageScanner extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageScanner
     * @type {Guid}
     */
    static IID => Guid("{53a88f78-5298-48a0-8da3-8087519665e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_DefaultScanSource", "IsScanSourceSupported", "get_FlatbedConfiguration", "get_FeederConfiguration", "get_AutoConfiguration", "IsPreviewSupported", "ScanPreviewToStreamAsync", "ScanFilesToFolderAsync"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Integer} 
     */
    DefaultScanSource {
        get => this.get_DefaultScanSource()
    }

    /**
     * @type {ImageScannerFlatbedConfiguration} 
     */
    FlatbedConfiguration {
        get => this.get_FlatbedConfiguration()
    }

    /**
     * @type {ImageScannerFeederConfiguration} 
     */
    FeederConfiguration {
        get => this.get_FeederConfiguration()
    }

    /**
     * @type {ImageScannerAutoConfiguration} 
     */
    AutoConfiguration {
        get => this.get_AutoConfiguration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultScanSource() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    IsScanSourceSupported(value) {
        result := ComCall(8, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {ImageScannerFlatbedConfiguration} 
     */
    get_FlatbedConfiguration() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageScannerFlatbedConfiguration(value)
    }

    /**
     * 
     * @returns {ImageScannerFeederConfiguration} 
     */
    get_FeederConfiguration() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageScannerFeederConfiguration(value)
    }

    /**
     * 
     * @returns {ImageScannerAutoConfiguration} 
     */
    get_AutoConfiguration() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageScannerAutoConfiguration(value)
    }

    /**
     * 
     * @param {Integer} scanSource 
     * @returns {Boolean} 
     */
    IsPreviewSupported(scanSource) {
        result := ComCall(12, this, "int", scanSource, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} scanSource 
     * @param {IRandomAccessStream} targetStream 
     * @returns {IAsyncOperation<ImageScannerPreviewResult>} 
     */
    ScanPreviewToStreamAsync(scanSource, targetStream) {
        result := ComCall(13, this, "int", scanSource, "ptr", targetStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ImageScannerPreviewResult, operation)
    }

    /**
     * 
     * @param {Integer} scanSource 
     * @param {StorageFolder} storageFolder_ 
     * @returns {IAsyncOperationWithProgress<ImageScannerScanResult, Integer>} 
     */
    ScanFilesToFolderAsync(scanSource, storageFolder_) {
        result := ComCall(14, this, "int", scanSource, "ptr", storageFolder_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(ImageScannerScanResult, (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}
