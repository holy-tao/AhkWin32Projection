#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDownloadProgressEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides event data for the [DownloadProgress](bitmapimage_downloadprogress.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.downloadprogresseventargs
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class DownloadProgressEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDownloadProgressEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDownloadProgressEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets download progress as a value that is between 0 and 100.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.downloadprogresseventargs.progress
     * @type {Integer} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Progress() {
        if (!this.HasProp("__IDownloadProgressEventArgs")) {
            if ((queryResult := this.QueryInterface(IDownloadProgressEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadProgressEventArgs := IDownloadProgressEventArgs(outPtr)
        }

        return this.__IDownloadProgressEventArgs.get_Progress()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Progress(value) {
        if (!this.HasProp("__IDownloadProgressEventArgs")) {
            if ((queryResult := this.QueryInterface(IDownloadProgressEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadProgressEventArgs := IDownloadProgressEventArgs(outPtr)
        }

        return this.__IDownloadProgressEventArgs.put_Progress(value)
    }

;@endregion Instance Methods
}
