#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerFrameReaderFrameArrivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This object is passed as a parameter to the event handlers for the [BarcodeScannerFrameReader.FrameArrived](barcodescannerframereader_framearrived.md) event.
 * @remarks
 * Use [GetDeferral](barcodescannerframereaderframearrivedeventargs_getdeferral_254836512.md) if processing needs to be done asynchronously outside the scope of the method handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereaderframearrivedeventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerFrameReaderFrameArrivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerFrameReaderFrameArrivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerFrameReaderFrameArrivedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereaderframearrivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerFrameReaderFrameArrivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReaderFrameArrivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReaderFrameArrivedEventArgs := IBarcodeScannerFrameReaderFrameArrivedEventArgs(outPtr)
        }

        return this.__IBarcodeScannerFrameReaderFrameArrivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
