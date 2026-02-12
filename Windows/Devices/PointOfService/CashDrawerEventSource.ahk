#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawerEventSource.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CashDrawerEventSource.ahk
#Include .\CashDrawerClosedEventArgs.ahk
#Include .\CashDrawerOpenedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides event sources that allow a developer to detect when the cash drawer is opened or closed.
 * @remarks
 * CashDrawerEventSource is created from [CashDrawer.DrawerEventSource](cashdrawer_drawereventsource.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawereventsource
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerEventSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawerEventSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawerEventSource.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDrawerClosedToken")) {
            this.remove_DrawerClosed(this.__OnDrawerClosedToken)
            this.__OnDrawerClosed.iface.Dispose()
        }

        if(this.HasProp("__OnDrawerOpenedToken")) {
            this.remove_DrawerOpened(this.__OnDrawerOpenedToken)
            this.__OnDrawerOpened.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CashDrawerEventSource, CashDrawerClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DrawerClosed(handler) {
        if (!this.HasProp("__ICashDrawerEventSource")) {
            if ((queryResult := this.QueryInterface(ICashDrawerEventSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerEventSource := ICashDrawerEventSource(outPtr)
        }

        return this.__ICashDrawerEventSource.add_DrawerClosed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DrawerClosed(token) {
        if (!this.HasProp("__ICashDrawerEventSource")) {
            if ((queryResult := this.QueryInterface(ICashDrawerEventSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerEventSource := ICashDrawerEventSource(outPtr)
        }

        return this.__ICashDrawerEventSource.remove_DrawerClosed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CashDrawerEventSource, CashDrawerOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DrawerOpened(handler) {
        if (!this.HasProp("__ICashDrawerEventSource")) {
            if ((queryResult := this.QueryInterface(ICashDrawerEventSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerEventSource := ICashDrawerEventSource(outPtr)
        }

        return this.__ICashDrawerEventSource.add_DrawerOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DrawerOpened(token) {
        if (!this.HasProp("__ICashDrawerEventSource")) {
            if ((queryResult := this.QueryInterface(ICashDrawerEventSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerEventSource := ICashDrawerEventSource(outPtr)
        }

        return this.__ICashDrawerEventSource.remove_DrawerOpened(token)
    }

;@endregion Instance Methods
}
