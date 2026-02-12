#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureFileGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppCaptureRecordOperation.FileGenerated](./appcapturerecordoperation_filegenerated.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturefilegeneratedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureFileGeneratedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureFileGeneratedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureFileGeneratedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the file associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturefilegeneratedeventargs.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
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
        if (!this.HasProp("__IAppCaptureFileGeneratedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppCaptureFileGeneratedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureFileGeneratedEventArgs := IAppCaptureFileGeneratedEventArgs(outPtr)
        }

        return this.__IAppCaptureFileGeneratedEventArgs.get_File()
    }

;@endregion Instance Methods
}
