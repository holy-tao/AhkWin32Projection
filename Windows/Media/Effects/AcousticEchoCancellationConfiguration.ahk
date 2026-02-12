#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAcousticEchoCancellationConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the configuration of an Acoustic Echo Cancellation (AEC) audio capture effect.
 * @remarks
 * Get an instance of this class by calling [AcousticEchoCancellationConfiguration](/uwp/api/windows.media.effects.audioeffect.acousticechocancellationconfiguration).
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.acousticechocancellationconfiguration
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AcousticEchoCancellationConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAcousticEchoCancellationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAcousticEchoCancellationConfiguration.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the endpoint that should be used as the loopback reference by the Acoustic Echo Cancellation (AEC) effect.
     * @remarks
     * Passing in a null string as the deviceId parameter will result in the loopback endpoint being reset to its default value.
     * @param {HSTRING} deviceId The device ID of the device to use as the loopback reference.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.acousticechocancellationconfiguration.setechocancellationrenderendpoint
     */
    SetEchoCancellationRenderEndpoint(deviceId) {
        if (!this.HasProp("__IAcousticEchoCancellationConfiguration")) {
            if ((queryResult := this.QueryInterface(IAcousticEchoCancellationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcousticEchoCancellationConfiguration := IAcousticEchoCancellationConfiguration(outPtr)
        }

        return this.__IAcousticEchoCancellationConfiguration.SetEchoCancellationRenderEndpoint(deviceId)
    }

;@endregion Instance Methods
}
