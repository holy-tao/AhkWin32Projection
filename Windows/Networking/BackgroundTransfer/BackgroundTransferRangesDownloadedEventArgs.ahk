#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTransferRangesDownloadedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to information about the incremental download progress event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferrangesdownloadedeventargs
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferRangesDownloadedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTransferRangesDownloadedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTransferRangesDownloadedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * TRUE if the download was restarted from scratch since the previous RangesDownloaded event.
     * @remarks
     * This is important, as the app will need to reset any state related to previously-processed DownloadedRanges data in that case. Download restarts can occur if the remote file’s timestamp or ETag changes.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferrangesdownloadedeventargs.wasdownloadrestarted
     * @type {Boolean} 
     */
    WasDownloadRestarted {
        get => this.get_WasDownloadRestarted()
    }

    /**
     * List of ranges that were downloaded since the previous [RangesDownloaded event](downloadoperation_rangesdownloaded.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferrangesdownloadedeventargs.addedranges
     * @type {IVector<BackgroundTransferFileRange>} 
     */
    AddedRanges {
        get => this.get_AddedRanges()
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
    get_WasDownloadRestarted() {
        if (!this.HasProp("__IBackgroundTransferRangesDownloadedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferRangesDownloadedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferRangesDownloadedEventArgs := IBackgroundTransferRangesDownloadedEventArgs(outPtr)
        }

        return this.__IBackgroundTransferRangesDownloadedEventArgs.get_WasDownloadRestarted()
    }

    /**
     * 
     * @returns {IVector<BackgroundTransferFileRange>} 
     */
    get_AddedRanges() {
        if (!this.HasProp("__IBackgroundTransferRangesDownloadedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferRangesDownloadedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferRangesDownloadedEventArgs := IBackgroundTransferRangesDownloadedEventArgs(outPtr)
        }

        return this.__IBackgroundTransferRangesDownloadedEventArgs.get_AddedRanges()
    }

    /**
     * Deferral allows apps to carry out asynchronous work within their RangesDownloaded handler without receiving a new [RangesDownloaded event](downloadoperation_rangesdownloaded.md) in the meantime.
     * @remarks
     * Serialized RangesDownloaded events make the app’s code more straightforward and let WinRT BackgroundTransfer coalesce RangesDownloaded events instead of flooding an app with multiple concurrent ones.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferrangesdownloadedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBackgroundTransferRangesDownloadedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferRangesDownloadedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferRangesDownloadedEventArgs := IBackgroundTransferRangesDownloadedEventArgs(outPtr)
        }

        return this.__IBackgroundTransferRangesDownloadedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
