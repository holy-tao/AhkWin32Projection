#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [PosPrinter.StatusUpdated](posprinter_statusupdated.md) event that occurs when the status of a point-of-service printer changes.
 * @remarks
 * An instance of this class is passed to the event handler that you create for the [PosPrinter.StatusUpdated](posprinter_statusupdated.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterstatusupdatedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterStatusUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinterStatusUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinterStatusUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new status of the point-of-service printer after the status of the printer changes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterstatusupdatedeventargs.status
     * @type {PosPrinterStatus} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PosPrinterStatus} 
     */
    get_Status() {
        if (!this.HasProp("__IPosPrinterStatusUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPosPrinterStatusUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterStatusUpdatedEventArgs := IPosPrinterStatusUpdatedEventArgs(outPtr)
        }

        return this.__IPosPrinterStatusUpdatedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
