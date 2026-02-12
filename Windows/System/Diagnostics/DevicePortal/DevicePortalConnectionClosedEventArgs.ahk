#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePortalConnectionClosedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a [DevicePortalConnection.Closed](DevicePortalConnection_Closed.md) event that was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionclosedeventargs
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class DevicePortalConnectionClosedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePortalConnectionClosedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePortalConnectionClosedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Describes the reason that the device portal connection was closed.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionclosedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
    get_Reason() {
        if (!this.HasProp("__IDevicePortalConnectionClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDevicePortalConnectionClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePortalConnectionClosedEventArgs := IDevicePortalConnectionClosedEventArgs(outPtr)
        }

        return this.__IDevicePortalConnectionClosedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
