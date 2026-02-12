#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHeadset.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about an audio headset attached to a gamepad.
 * @remarks
 * Instances of the Headset class cannot be created directly; instead, instances of the Headset class are retrieved through the [Gamepad.Headset](gamepad_headset.md) property or the [Gamepad.HeadsetConnected](gamepad_headsetconnected.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.headset
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class Headset extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHeadset

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHeadset.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The XAudio endpoint ID for the headset's audio capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.headset.capturedeviceid
     * @type {HSTRING} 
     */
    CaptureDeviceId {
        get => this.get_CaptureDeviceId()
    }

    /**
     * The XAudio enpoint ID for the headset's audio render device.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.headset.renderdeviceid
     * @type {HSTRING} 
     */
    RenderDeviceId {
        get => this.get_RenderDeviceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CaptureDeviceId() {
        if (!this.HasProp("__IHeadset")) {
            if ((queryResult := this.QueryInterface(IHeadset.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadset := IHeadset(outPtr)
        }

        return this.__IHeadset.get_CaptureDeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RenderDeviceId() {
        if (!this.HasProp("__IHeadset")) {
            if ((queryResult := this.QueryInterface(IHeadset.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadset := IHeadset(outPtr)
        }

        return this.__IHeadset.get_RenderDeviceId()
    }

    /**
     * Gets information about the headset's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.headset.trygetbatteryreport
     */
    TryGetBatteryReport() {
        if (!this.HasProp("__IGameControllerBatteryInfo")) {
            if ((queryResult := this.QueryInterface(IGameControllerBatteryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerBatteryInfo := IGameControllerBatteryInfo(outPtr)
        }

        return this.__IGameControllerBatteryInfo.TryGetBatteryReport()
    }

;@endregion Instance Methods
}
