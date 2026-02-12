#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionFrameSourcePropertiesStatics2.ahk
#Include .\IKnownPerceptionFrameSourcePropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties that are applicable to all types of frame sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionFrameSourceProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string value that identifies the device on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties.deviceid
     * @type {HSTRING} 
     */
    static DeviceId {
        get => KnownPerceptionFrameSourceProperties.get_DeviceId()
    }

    /**
     * Gets a string key used to look up a string property with the unique ID of the frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties.id
     * @type {HSTRING} 
     */
    static Id {
        get => KnownPerceptionFrameSourceProperties.get_Id()
    }

    /**
     * Gets a string key used to look up a string array property containing the physical device IDs of the sensor this frame source represents.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties.physicaldeviceids
     * @type {HSTRING} 
     */
    static PhysicalDeviceIds {
        get => KnownPerceptionFrameSourceProperties.get_PhysicalDeviceIds()
    }

    /**
     * Gets a string key used to look up a string property that is a string key indicating the kind of frame the source provides.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties.framekind
     * @type {HSTRING} 
     */
    static FrameKind {
        get => KnownPerceptionFrameSourceProperties.get_FrameKind()
    }

    /**
     * Gets a string key used to look up a string property with the device, model, version string for the physical sensor device this frame source represents.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties.devicemodelversion
     * @type {HSTRING} 
     */
    static DeviceModelVersion {
        get => KnownPerceptionFrameSourceProperties.get_DeviceModelVersion()
    }

    /**
     * Gets a string key used to look up an enumeration property indicating the physical location of the sensor on the Windows device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptionframesourceproperties.enclosurelocation
     * @type {HSTRING} 
     */
    static EnclosureLocation {
        get => KnownPerceptionFrameSourceProperties.get_EnclosureLocation()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DeviceId() {
        if (!KnownPerceptionFrameSourceProperties.HasProp("__IKnownPerceptionFrameSourcePropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameSourcePropertiesStatics2.IID)
            KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics2 := IKnownPerceptionFrameSourcePropertiesStatics2(factoryPtr)
        }

        return KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics2.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Id() {
        if (!KnownPerceptionFrameSourceProperties.HasProp("__IKnownPerceptionFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameSourcePropertiesStatics.IID)
            KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics := IKnownPerceptionFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PhysicalDeviceIds() {
        if (!KnownPerceptionFrameSourceProperties.HasProp("__IKnownPerceptionFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameSourcePropertiesStatics.IID)
            KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics := IKnownPerceptionFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics.get_PhysicalDeviceIds()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FrameKind() {
        if (!KnownPerceptionFrameSourceProperties.HasProp("__IKnownPerceptionFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameSourcePropertiesStatics.IID)
            KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics := IKnownPerceptionFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics.get_FrameKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DeviceModelVersion() {
        if (!KnownPerceptionFrameSourceProperties.HasProp("__IKnownPerceptionFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameSourcePropertiesStatics.IID)
            KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics := IKnownPerceptionFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics.get_DeviceModelVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EnclosureLocation() {
        if (!KnownPerceptionFrameSourceProperties.HasProp("__IKnownPerceptionFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionFrameSourcePropertiesStatics.IID)
            KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics := IKnownPerceptionFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionFrameSourceProperties.__IKnownPerceptionFrameSourcePropertiesStatics.get_EnclosureLocation()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
