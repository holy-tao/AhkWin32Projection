#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownDeviceTypesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents know device types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.knowndevicetypes
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class KnownDeviceTypes extends IInspectable {
;@region Static Properties
    /**
     * Defined by the device vendor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.knowndevicetypes.unknown
     * @type {Integer} 
     */
    static Unknown {
        get => KnownDeviceTypes.get_Unknown()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Unknown() {
        if (!KnownDeviceTypes.HasProp("__IKnownDeviceTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Custom.KnownDeviceTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownDeviceTypesStatics.IID)
            KnownDeviceTypes.__IKnownDeviceTypesStatics := IKnownDeviceTypesStatics(factoryPtr)
        }

        return KnownDeviceTypes.__IKnownDeviceTypesStatics.get_Unknown()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
