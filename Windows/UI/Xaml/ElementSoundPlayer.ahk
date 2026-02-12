#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IElementSoundPlayer.ahk
#Include .\IElementSoundPlayerStatics2.ahk
#Include .\IElementSoundPlayerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a player for XAML control sounds.
 * @remarks
 * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundplayer
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementSoundPlayer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IElementSoundPlayer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IElementSoundPlayer.IID

    /**
     * Gets or sets a value that indicates whether spatial audio is on, off, or handled automatically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundplayer.spatialaudiomode
     * @type {Integer} 
     */
    static SpatialAudioMode {
        get => ElementSoundPlayer.get_SpatialAudioMode()
        set => ElementSoundPlayer.put_SpatialAudioMode(value)
    }

    /**
     * Gets or sets the volume of the sounds played by the Play method.
     * @remarks
     * You can set the Volume property to reduce the volume relative to the system volume. 1.0 is the maximum and is equal to the system volume. 0.0 is the minimum and is the same as muted.
     * 
     * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundplayer.volume
     * @type {Float} 
     */
    static Volume {
        get => ElementSoundPlayer.get_Volume()
        set => ElementSoundPlayer.put_Volume(value)
    }

    /**
     * Gets or sets a value that specifies whether the system plays control sounds.
     * @remarks
     * By default, control sounds are played on the Xbox, and are not played on other devices families. You can set [ElementSoundPlayerState](elementsoundplayerstate.md) to **On** to make your app play sounds on all device families, or set it to **Off** to disable sounds on all device families.
     * 
     * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundplayer.state
     * @type {Integer} 
     */
    static State {
        get => ElementSoundPlayer.get_State()
        set => ElementSoundPlayer.put_State(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_SpatialAudioMode() {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics2.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics2 := IElementSoundPlayerStatics2(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics2.get_SpatialAudioMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_SpatialAudioMode(value) {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics2.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics2 := IElementSoundPlayerStatics2(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics2.put_SpatialAudioMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_Volume() {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics := IElementSoundPlayerStatics(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics.get_Volume()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    static put_Volume(value) {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics := IElementSoundPlayerStatics(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics.put_Volume(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_State() {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics := IElementSoundPlayerStatics(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics.get_State()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_State(value) {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics := IElementSoundPlayerStatics(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics.put_State(value)
    }

    /**
     * Plays the specified sound.
     * @remarks
     * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
     * @param {Integer} sound A value of the enumeration that specifies the sound to play.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundplayer.play
     */
    static Play(sound) {
        if (!ElementSoundPlayer.HasProp("__IElementSoundPlayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementSoundPlayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementSoundPlayerStatics.IID)
            ElementSoundPlayer.__IElementSoundPlayerStatics := IElementSoundPlayerStatics(factoryPtr)
        }

        return ElementSoundPlayer.__IElementSoundPlayerStatics.Play(sound)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
