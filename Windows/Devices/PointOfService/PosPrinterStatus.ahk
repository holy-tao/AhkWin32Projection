#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the status of a point-of-service printer, such as the power state of the printer.
 * @remarks
 * You can get the PosPrinterStatus either by using the [PosPrinter.Status](posprinter_status.md) or [PosPrinterStatusUpdatedEventArgs.Status](posprinterstatusupdatedeventargs_status.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterstatus
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinterStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinterStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the power state of a point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterstatus.statuskind
     * @type {Integer} 
     */
    StatusKind {
        get => this.get_StatusKind()
    }

    /**
     * Gets extended information about the power state of the point-of-service printer that the original equipment manufacturer (OEM) defines. Value is only valid if the [PosPrinterStatus.StatusKind](posprinterstatus_statuskind.md) property is **PosPrinterStatusKind.Extended**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterstatus.extendedstatus
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
    get_StatusKind() {
        if (!this.HasProp("__IPosPrinterStatus")) {
            if ((queryResult := this.QueryInterface(IPosPrinterStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterStatus := IPosPrinterStatus(outPtr)
        }

        return this.__IPosPrinterStatus.get_StatusKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        if (!this.HasProp("__IPosPrinterStatus")) {
            if ((queryResult := this.QueryInterface(IPosPrinterStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterStatus := IPosPrinterStatus(outPtr)
        }

        return this.__IPosPrinterStatus.get_ExtendedStatus()
    }

;@endregion Instance Methods
}
