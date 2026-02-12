#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionFrameKindStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A string used to identify the type classification of a frame.
 * @remarks
 * Possible values are Color, Depth, and Infrared.
 * 
 * FrameProviders must indicate the type of frames they return by setting a FrameKind property on the IPerceptionFrameProviderInfo that matches one of the values retrieved from this static class.
 * 
 * For example, if your FrameProvider returns Color frames, the FrameKind property of the IPerceptionFrameProviderInfo objects your provider must be set KnownPerceptionFrameKind::Color.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.knownperceptionframekind
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionFrameKind extends IInspectable {
;@region Static Properties
    /**
     * Gets the string representing the Color FrameKind of a PerceptionFrameProviderInfo.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.knownperceptionframekind.color
     * @type {HSTRING} 
     */
    static Color {
        get => KnownPerceptionFrameKind.get_Color()
    }

    /**
     * Gets the string representing the Depth FrameKind of a PerceptionFrameProviderInfo.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.knownperceptionframekind.depth
     * @type {HSTRING} 
     */
    static Depth {
        get => KnownPerceptionFrameKind.get_Depth()
    }

    /**
     * Gets the string representing the Infrared FrameKind of a PerceptionFrameProviderInfo.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.knownperceptionframekind.infrared
     * @type {HSTRING} 
     */
    static Infrared {
        get => KnownPerceptionFrameKind.get_Infrared()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Color() {
        if (!KnownPerceptionFrameKind.HasProp("__IKnownPerceptionFrameKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.KnownPerceptionFrameKind")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameKindStatics.IID)
            KnownPerceptionFrameKind.__IKnownPerceptionFrameKindStatics := IKnownPerceptionFrameKindStatics(factoryPtr)
        }

        return KnownPerceptionFrameKind.__IKnownPerceptionFrameKindStatics.get_Color()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Depth() {
        if (!KnownPerceptionFrameKind.HasProp("__IKnownPerceptionFrameKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.KnownPerceptionFrameKind")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameKindStatics.IID)
            KnownPerceptionFrameKind.__IKnownPerceptionFrameKindStatics := IKnownPerceptionFrameKindStatics(factoryPtr)
        }

        return KnownPerceptionFrameKind.__IKnownPerceptionFrameKindStatics.get_Depth()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Infrared() {
        if (!KnownPerceptionFrameKind.HasProp("__IKnownPerceptionFrameKindStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.KnownPerceptionFrameKind")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameKindStatics.IID)
            KnownPerceptionFrameKind.__IKnownPerceptionFrameKindStatics := IKnownPerceptionFrameKindStatics(factoryPtr)
        }

        return KnownPerceptionFrameKind.__IKnownPerceptionFrameKindStatics.get_Infrared()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
