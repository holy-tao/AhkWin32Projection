#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoStabilizationEffectEnabledChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [VideoStabilizationEffect.EnabledChanged](videostabilizationeffect_enabledchanged.md) event.
 * @remarks
 * Get an instance of this by handling the [VideoStabilizationEffect.EnabledChanged](videostabilizationeffect_enabledchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffectenabledchangedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoStabilizationEffectEnabledChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoStabilizationEffectEnabledChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoStabilizationEffectEnabledChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the reason why the [VideoStabilizationEffect.Enabled](videostabilizationeffect_enabled.md) property changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffectenabledchangedeventargs.reason
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
        if (!this.HasProp("__IVideoStabilizationEffectEnabledChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVideoStabilizationEffectEnabledChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStabilizationEffectEnabledChangedEventArgs := IVideoStabilizationEffectEnabledChangedEventArgs(outPtr)
        }

        return this.__IVideoStabilizationEffectEnabledChangedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
