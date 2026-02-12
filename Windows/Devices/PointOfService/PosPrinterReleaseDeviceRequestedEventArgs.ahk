#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterReleaseDeviceRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [ClaimedPosPrinter.ReleaseDeviceRequested](claimedposprinter_releasedevicerequested.md) event that occurs when a point-of-service printer gets a request to release its exclusive claim.
 * @remarks
 * An instance of this class is passed to the event handler that you create for the [ClaimedPosPrinter.ReleaseDeviceRequested](claimedposprinter_releasedevicerequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterreleasedevicerequestedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterReleaseDeviceRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinterReleaseDeviceRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinterReleaseDeviceRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
