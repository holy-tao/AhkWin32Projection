#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppRecordingStatus.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\AppRecordingResult.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\AppRecordingSaveScreenshotResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class IAppRecordingManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppRecordingManager
     * @type {Guid}
     */
    static IID => Guid("{e7e26076-a044-48e2-a512-3094d574c7cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "StartRecordingToFileAsync", "RecordTimeSpanToFileAsync", "get_SupportedScreenshotMediaEncodingSubtypes", "SaveScreenshotToFilesAsync"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SupportedScreenshotMediaEncodingSubtypes {
        get => this.get_SupportedScreenshotMediaEncodingSubtypes()
    }

    /**
     * 
     * @returns {AppRecordingStatus} 
     */
    GetStatus() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppRecordingStatus(result_)
    }

    /**
     * 
     * @param {StorageFile} file_ 
     * @returns {IAsyncOperation<AppRecordingResult>} 
     */
    StartRecordingToFileAsync(file_) {
        result := ComCall(7, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppRecordingResult, operation)
    }

    /**
     * 
     * @param {DateTime} startTime 
     * @param {TimeSpan} duration_ 
     * @param {StorageFile} file_ 
     * @returns {IAsyncOperation<AppRecordingResult>} 
     */
    RecordTimeSpanToFileAsync(startTime, duration_, file_) {
        result := ComCall(8, this, "ptr", startTime, "ptr", duration_, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppRecordingResult, operation)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedScreenshotMediaEncodingSubtypes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {StorageFolder} folder_ 
     * @param {HSTRING} filenamePrefix 
     * @param {Integer} option 
     * @param {IIterable<HSTRING>} requestedFormats 
     * @returns {IAsyncOperation<AppRecordingSaveScreenshotResult>} 
     */
    SaveScreenshotToFilesAsync(folder_, filenamePrefix, option, requestedFormats) {
        if(filenamePrefix is String) {
            pin := HSTRING.Create(filenamePrefix)
            filenamePrefix := pin.Value
        }
        filenamePrefix := filenamePrefix is Win32Handle ? NumGet(filenamePrefix, "ptr") : filenamePrefix

        result := ComCall(10, this, "ptr", folder_, "ptr", filenamePrefix, "int", option, "ptr", requestedFormats, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppRecordingSaveScreenshotResult, operation)
    }
}
