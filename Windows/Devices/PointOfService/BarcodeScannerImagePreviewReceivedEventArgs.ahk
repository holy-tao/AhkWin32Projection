#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerImagePreviewReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the data from the [ImagePreviewReceived](claimedbarcodescanner_imagepreviewreceived.md) event.
 * @remarks
 * This object is created by the [ImagePreviewReceived](claimedbarcodescanner_imagepreviewreceived.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerimagepreviewreceivedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerImagePreviewReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerImagePreviewReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerImagePreviewReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the  from the device representing a preview frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerimagepreviewreceivedeventargs.preview
     * @type {IRandomAccessStreamWithContentType} 
     */
    Preview {
        get => this.get_Preview()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_Preview() {
        if (!this.HasProp("__IBarcodeScannerImagePreviewReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerImagePreviewReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerImagePreviewReceivedEventArgs := IBarcodeScannerImagePreviewReceivedEventArgs(outPtr)
        }

        return this.__IBarcodeScannerImagePreviewReceivedEventArgs.get_Preview()
    }

;@endregion Instance Methods
}
