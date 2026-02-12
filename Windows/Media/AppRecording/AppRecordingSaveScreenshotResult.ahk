#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppRecordingSaveScreenshotResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of a screenshot operation initiated with a call to [SaveScreenshotToFilesAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavescreenshotresult
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingSaveScreenshotResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppRecordingSaveScreenshotResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppRecordingSaveScreenshotResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the screenshot operation succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavescreenshotresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets the extended error code associated returned by the screenshot operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavescreenshotresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets a list of [AppRecordingSavedScreenshotInfo](C:\Users\drewbat\Source\Repos\winrt-api\windows.media.apprecording\apprecordingsavedscreenshotinfo_file.md) objects representing the image files saved from the screenshot operation.
     * @remarks
     * [SaveScreenshotToFilesAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md) allows you to save multiple image files, each with different image encoding, with a single call. The **AppRecordingSavedScreenshotInfo** objects returned by this property allow you to access the **StorageFile** and encoding subtype for each saved image.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavescreenshotresult.savedscreenshotinfos
     * @type {IVectorView<AppRecordingSavedScreenshotInfo>} 
     */
    SavedScreenshotInfos {
        get => this.get_SavedScreenshotInfos()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IAppRecordingSaveScreenshotResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingSaveScreenshotResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingSaveScreenshotResult := IAppRecordingSaveScreenshotResult(outPtr)
        }

        return this.__IAppRecordingSaveScreenshotResult.get_Succeeded()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAppRecordingSaveScreenshotResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingSaveScreenshotResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingSaveScreenshotResult := IAppRecordingSaveScreenshotResult(outPtr)
        }

        return this.__IAppRecordingSaveScreenshotResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {IVectorView<AppRecordingSavedScreenshotInfo>} 
     */
    get_SavedScreenshotInfos() {
        if (!this.HasProp("__IAppRecordingSaveScreenshotResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingSaveScreenshotResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingSaveScreenshotResult := IAppRecordingSaveScreenshotResult(outPtr)
        }

        return this.__IAppRecordingSaveScreenshotResult.get_SavedScreenshotInfos()
    }

;@endregion Instance Methods
}
