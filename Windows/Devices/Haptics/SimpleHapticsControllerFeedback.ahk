#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISimpleHapticsControllerFeedback.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the feedback behaviors supported by the haptic input device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontrollerfeedback
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class SimpleHapticsControllerFeedback extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISimpleHapticsControllerFeedback

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISimpleHapticsControllerFeedback.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the haptic waveform type for the haptic input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontrollerfeedback.waveform
     * @type {Integer} 
     */
    Waveform {
        get => this.get_Waveform()
    }

    /**
     * Gets the feedback duration for the haptic input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontrollerfeedback.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
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
    get_Waveform() {
        if (!this.HasProp("__ISimpleHapticsControllerFeedback")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsControllerFeedback.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsControllerFeedback := ISimpleHapticsControllerFeedback(outPtr)
        }

        return this.__ISimpleHapticsControllerFeedback.get_Waveform()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__ISimpleHapticsControllerFeedback")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsControllerFeedback.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsControllerFeedback := ISimpleHapticsControllerFeedback(outPtr)
        }

        return this.__ISimpleHapticsControllerFeedback.get_Duration()
    }

;@endregion Instance Methods
}
