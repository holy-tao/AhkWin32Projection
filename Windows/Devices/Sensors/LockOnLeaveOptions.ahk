#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockOnLeaveOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to manage the locking behavior of the PC screen based on whether a user is detected by the human presence sensor.
 * @remarks
 * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
 * 
 * The user can specify their preferred lock on leave behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lockonleaveoptions
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class LockOnLeaveOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockOnLeaveOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockOnLeaveOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether lock on leave behavior is enabled when an external monitor is connected to the system.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * The user can specify their preferred lock on leave behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lockonleaveoptions.allowwhenexternaldisplayconnected
     * @type {Boolean} 
     */
    AllowWhenExternalDisplayConnected {
        get => this.get_AllowWhenExternalDisplayConnected()
        set => this.put_AllowWhenExternalDisplayConnected(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowWhenExternalDisplayConnected() {
        if (!this.HasProp("__ILockOnLeaveOptions")) {
            if ((queryResult := this.QueryInterface(ILockOnLeaveOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockOnLeaveOptions := ILockOnLeaveOptions(outPtr)
        }

        return this.__ILockOnLeaveOptions.get_AllowWhenExternalDisplayConnected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWhenExternalDisplayConnected(value) {
        if (!this.HasProp("__ILockOnLeaveOptions")) {
            if ((queryResult := this.QueryInterface(ILockOnLeaveOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockOnLeaveOptions := ILockOnLeaveOptions(outPtr)
        }

        return this.__ILockOnLeaveOptions.put_AllowWhenExternalDisplayConnected(value)
    }

;@endregion Instance Methods
}
