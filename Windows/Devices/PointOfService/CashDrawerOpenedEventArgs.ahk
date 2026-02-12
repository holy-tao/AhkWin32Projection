#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawerEventSourceEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * This object is passed as a parameter to the event handlers for the [DrawerOpened](cashdrawereventsource_draweropened.md) event.
 * @remarks
 * This object is created by the [DrawerOpened](cashdrawereventsource_draweropened.md) event and is returned as an argument by the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdraweropenedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerOpenedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawerEventSourceEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawerEventSourceEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data associated with the [DrawerOpened](cashdrawereventsource_draweropened.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdraweropenedeventargs.cashdrawer
     * @type {CashDrawer} 
     */
    CashDrawer {
        get => this.get_CashDrawer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CashDrawer} 
     */
    get_CashDrawer() {
        if (!this.HasProp("__ICashDrawerEventSourceEventArgs")) {
            if ((queryResult := this.QueryInterface(ICashDrawerEventSourceEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerEventSourceEventArgs := ICashDrawerEventSourceEventArgs(outPtr)
        }

        return this.__ICashDrawerEventSourceEventArgs.get_CashDrawer()
    }

;@endregion Instance Methods
}
