#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerHideVideoPreviewRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to hide a video preview window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerHideVideoPreviewRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerHideVideoPreviewRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerHideVideoPreviewRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerHideVideoPreviewRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequesteventargs.request
     * @type {BarcodeScannerHideVideoPreviewRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BarcodeScannerHideVideoPreviewRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerHideVideoPreviewRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerHideVideoPreviewRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerHideVideoPreviewRequestEventArgs := IBarcodeScannerHideVideoPreviewRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerHideVideoPreviewRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerHideVideoPreviewRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerHideVideoPreviewRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerHideVideoPreviewRequestEventArgs := IBarcodeScannerHideVideoPreviewRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerHideVideoPreviewRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
