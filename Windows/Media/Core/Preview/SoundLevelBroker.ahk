#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISoundLevelBrokerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about how the app's current sound level is affected by system policy.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.preview.soundlevelbroker
 * @namespace Windows.Media.Core.Preview
 * @version WindowsRuntime 1.4
 */
class SoundLevelBroker extends IInspectable {
;@region Static Properties
    /**
     * Gets the current sound level of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.preview.soundlevelbroker.soundlevel
     * @type {Integer} 
     */
    static SoundLevel {
        get => SoundLevelBroker.get_SoundLevel()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_SoundLevel() {
        if (!SoundLevelBroker.HasProp("__ISoundLevelBrokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.Preview.SoundLevelBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoundLevelBrokerStatics.IID)
            SoundLevelBroker.__ISoundLevelBrokerStatics := ISoundLevelBrokerStatics(factoryPtr)
        }

        return SoundLevelBroker.__ISoundLevelBrokerStatics.get_SoundLevel()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_SoundLevelChanged(handler) {
        if (!SoundLevelBroker.HasProp("__ISoundLevelBrokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.Preview.SoundLevelBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoundLevelBrokerStatics.IID)
            SoundLevelBroker.__ISoundLevelBrokerStatics := ISoundLevelBrokerStatics(factoryPtr)
        }

        return SoundLevelBroker.__ISoundLevelBrokerStatics.add_SoundLevelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_SoundLevelChanged(token) {
        if (!SoundLevelBroker.HasProp("__ISoundLevelBrokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.Preview.SoundLevelBroker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISoundLevelBrokerStatics.IID)
            SoundLevelBroker.__ISoundLevelBrokerStatics := ISoundLevelBrokerStatics(factoryPtr)
        }

        return SoundLevelBroker.__ISoundLevelBrokerStatics.remove_SoundLevelChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
