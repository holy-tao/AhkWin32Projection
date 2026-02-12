#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawerStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the current power and availability status of the cash drawer.
 * @remarks
 * CashDrawerStatus comes from the [StatusUpdated](cashdrawer_statusupdated.md) event or from the [Status](cashdrawer_status.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerstatus
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawerStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawerStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status kind for the cash drawer status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerstatus.statuskind
     * @type {Integer} 
     */
    StatusKind {
        get => this.get_StatusKind()
    }

    /**
     * ExtendedStatus provides a way for a Point of Service driver or provider to send custom notifications to the app.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerstatus.extendedstatus
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
        if (!this.HasProp("__ICashDrawerStatus")) {
            if ((queryResult := this.QueryInterface(ICashDrawerStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerStatus := ICashDrawerStatus(outPtr)
        }

        return this.__ICashDrawerStatus.get_StatusKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        if (!this.HasProp("__ICashDrawerStatus")) {
            if ((queryResult := this.QueryInterface(ICashDrawerStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerStatus := ICashDrawerStatus(outPtr)
        }

        return this.__ICashDrawerStatus.get_ExtendedStatus()
    }

;@endregion Instance Methods
}
