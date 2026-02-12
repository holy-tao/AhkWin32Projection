#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an operation status change.
 * @remarks
 * This object is created by the [StatusUpdated](barcodescanner_statusupdated.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerstatusupdatedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerStatusUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerStatusUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerStatusUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status change information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerstatusupdatedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the vendor specific status code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.barcodescannerstatusupdatedeventargs.extendedstatus
     * @type {Integer} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
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
    get_Status() {
        if (!this.HasProp("__IBarcodeScannerStatusUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerStatusUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerStatusUpdatedEventArgs := IBarcodeScannerStatusUpdatedEventArgs(outPtr)
        }

        return this.__IBarcodeScannerStatusUpdatedEventArgs.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        if (!this.HasProp("__IBarcodeScannerStatusUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerStatusUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerStatusUpdatedEventArgs := IBarcodeScannerStatusUpdatedEventArgs(outPtr)
        }

        return this.__IBarcodeScannerStatusUpdatedEventArgs.get_ExtendedStatus()
    }

;@endregion Instance Methods
}
