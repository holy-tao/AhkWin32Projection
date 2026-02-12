#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawerStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * This object is passed as a parameter to the event handlers for the [StatusUpdated](cashdrawer_statusupdated.md) event.
 * @remarks
 * This object is created by the [StatusUpdated](cashdrawer_statusupdated.md) event and is returned as an argument by the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerstatusupdatedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerStatusUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawerStatusUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawerStatusUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data associated with the [StatusUpdated](cashdrawer_statusupdated.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawerstatusupdatedeventargs.status
     * @type {CashDrawerStatus} 
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
     * @returns {CashDrawerStatus} 
     */
    get_Status() {
        if (!this.HasProp("__ICashDrawerStatusUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICashDrawerStatusUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerStatusUpdatedEventArgs := ICashDrawerStatusUpdatedEventArgs(outPtr)
        }

        return this.__ICashDrawerStatusUpdatedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
