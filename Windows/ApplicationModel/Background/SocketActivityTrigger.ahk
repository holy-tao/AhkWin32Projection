#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\ISocketActivityTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task for handling socket activity.
 * @remarks
 * For information about how to use this event and the socket broker with your app, see [Network communications in the background](/windows/uwp/networking/network-communications-in-the-background).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.socketactivitytrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SocketActivityTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether a [SocketActivityTrigger](socketactivitytrigger.md) can wake the machine from a low power state.
     * @remarks
     * This trigger is registered such that when there is new data available on the socket it will wake the device and activate the background task. On devices that don't support always on, always connected (AOAC), the device will not be awakened to trigger the background task.
     * 
     * Devices that support AOAC can be put into standby mode without fully powering down. In this mode it can maintain network connectivity. On these devices, a trigger can wake up the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.socketactivitytrigger.iswakefromlowpowersupported
     * @type {Boolean} 
     */
    IsWakeFromLowPowerSupported {
        get => this.get_IsWakeFromLowPowerSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a socket activity trigger.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SocketActivityTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWakeFromLowPowerSupported() {
        if (!this.HasProp("__ISocketActivityTrigger")) {
            if ((queryResult := this.QueryInterface(ISocketActivityTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityTrigger := ISocketActivityTrigger(outPtr)
        }

        return this.__ISocketActivityTrigger.get_IsWakeFromLowPowerSupported()
    }

;@endregion Instance Methods
}
