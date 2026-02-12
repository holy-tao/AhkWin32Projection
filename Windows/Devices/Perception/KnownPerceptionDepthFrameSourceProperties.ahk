#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionDepthFrameSourcePropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties of depth frame sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptiondepthframesourceproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionDepthFrameSourceProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string key used to retrieve a 16-bit unsigned integer property indicating the minimum depth of the depth frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptiondepthframesourceproperties.mindepth
     * @type {HSTRING} 
     */
    static MinDepth {
        get => KnownPerceptionDepthFrameSourceProperties.get_MinDepth()
    }

    /**
     * Gets a string key used to retrieve a 16-bit unsigned integer property indicating the maximum depth of the depth frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptiondepthframesourceproperties.maxdepth
     * @type {HSTRING} 
     */
    static MaxDepth {
        get => KnownPerceptionDepthFrameSourceProperties.get_MaxDepth()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MinDepth() {
        if (!KnownPerceptionDepthFrameSourceProperties.HasProp("__IKnownPerceptionDepthFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionDepthFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionDepthFrameSourcePropertiesStatics.IID)
            KnownPerceptionDepthFrameSourceProperties.__IKnownPerceptionDepthFrameSourcePropertiesStatics := IKnownPerceptionDepthFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionDepthFrameSourceProperties.__IKnownPerceptionDepthFrameSourcePropertiesStatics.get_MinDepth()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MaxDepth() {
        if (!KnownPerceptionDepthFrameSourceProperties.HasProp("__IKnownPerceptionDepthFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionDepthFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionDepthFrameSourcePropertiesStatics.IID)
            KnownPerceptionDepthFrameSourceProperties.__IKnownPerceptionDepthFrameSourcePropertiesStatics := IKnownPerceptionDepthFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionDepthFrameSourceProperties.__IKnownPerceptionDepthFrameSourcePropertiesStatics.get_MaxDepth()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
