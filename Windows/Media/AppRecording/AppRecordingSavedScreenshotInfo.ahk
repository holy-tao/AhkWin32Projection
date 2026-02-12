#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppRecordingSavedScreenshotInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about an image file saved from the screenshot operation, including the **StorageFile** associated with the file and the media encoding subtype indicating the format of the file.
 * @remarks
 * Get an instance of this class by accessing the [SavedScreenshotInfos](apprecordingsavescreenshotresult_savedscreenshotinfos.md) property of the [AppRecordingSaveScreenshotResult](apprecordingsavescreenshotresult.md) returned from a call to [SaveScreenshotToFileAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavedscreenshotinfo
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingSavedScreenshotInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppRecordingSavedScreenshotInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppRecordingSavedScreenshotInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the file to which a screenshot saved with [SaveScreenshotToFilesAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md) was saved.
     * @remarks
     * Get the list of the **AppRecordingSavedScreenShotInfo** objects representing the results of an app screenshot operation by accessing the [SavedSCreenshotInfos](apprecordingsavescreenshotresult_savedscreenshotinfos.md) property of the [AppRecordingSavedScreenshotResult](apprecordingsavescreenshotresult.md) object returned by the asynchronous **SaveScreenshotToFilesAsync** operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavedscreenshotinfo.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * Gets a string representing the media encoding subtype of the image format with which a screenshot saved with [SaveScreenshotToFilesAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md) was encoded.
     * @remarks
     * Get the list of the **AppRecordingSavedScreenShotInfo** objects representing the results of an app screenshot operation by accessing the [SavedSCreenshotInfos](apprecordingsavescreenshotresult_savedscreenshotinfos.md) property of the [AppRecordingSavedScreenshotResult](apprecordingsavescreenshotresult.md) object returned by the asynchronous **SaveScreenshotToFilesAsync** operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavedscreenshotinfo.mediaencodingsubtype
     * @type {HSTRING} 
     */
    MediaEncodingSubtype {
        get => this.get_MediaEncodingSubtype()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        if (!this.HasProp("__IAppRecordingSavedScreenshotInfo")) {
            if ((queryResult := this.QueryInterface(IAppRecordingSavedScreenshotInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingSavedScreenshotInfo := IAppRecordingSavedScreenshotInfo(outPtr)
        }

        return this.__IAppRecordingSavedScreenshotInfo.get_File()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaEncodingSubtype() {
        if (!this.HasProp("__IAppRecordingSavedScreenshotInfo")) {
            if ((queryResult := this.QueryInterface(IAppRecordingSavedScreenshotInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingSavedScreenshotInfo := IAppRecordingSavedScreenshotInfo(outPtr)
        }

        return this.__IAppRecordingSavedScreenshotInfo.get_MediaEncodingSubtype()
    }

;@endregion Instance Methods
}
