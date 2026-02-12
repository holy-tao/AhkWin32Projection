#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemSupportInfoStatics.ahk
#Include .\ISystemSupportInfoStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides support information about the device. This includes the local system edition, and OEM support information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportinfo
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class SystemSupportInfo extends IInspectable {
;@region Static Properties
    /**
     * Gets the local system edition of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportinfo.localsystemedition
     * @type {HSTRING} 
     */
    static LocalSystemEdition {
        get => SystemSupportInfo.get_LocalSystemEdition()
    }

    /**
     * Gets the OEM support information for the system.
     * @remarks
     * OEM support info includes the OEM’s name, web site address, and other support details.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportinfo.oemsupportinfo
     * @type {OemSupportInfo} 
     */
    static OemSupportInfo {
        get => SystemSupportInfo.get_OemSupportInfo()
    }

    /**
     * Gets the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportinfo.localdeviceinfo
     * @type {SystemSupportDeviceInfo} 
     */
    static LocalDeviceInfo {
        get => SystemSupportInfo.get_LocalDeviceInfo()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LocalSystemEdition() {
        if (!SystemSupportInfo.HasProp("__ISystemSupportInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemManufacturers.SystemSupportInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemSupportInfoStatics.IID)
            SystemSupportInfo.__ISystemSupportInfoStatics := ISystemSupportInfoStatics(factoryPtr)
        }

        return SystemSupportInfo.__ISystemSupportInfoStatics.get_LocalSystemEdition()
    }

    /**
     * 
     * @returns {OemSupportInfo} 
     */
    static get_OemSupportInfo() {
        if (!SystemSupportInfo.HasProp("__ISystemSupportInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemManufacturers.SystemSupportInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemSupportInfoStatics.IID)
            SystemSupportInfo.__ISystemSupportInfoStatics := ISystemSupportInfoStatics(factoryPtr)
        }

        return SystemSupportInfo.__ISystemSupportInfoStatics.get_OemSupportInfo()
    }

    /**
     * 
     * @returns {SystemSupportDeviceInfo} 
     */
    static get_LocalDeviceInfo() {
        if (!SystemSupportInfo.HasProp("__ISystemSupportInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemManufacturers.SystemSupportInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemSupportInfoStatics2.IID)
            SystemSupportInfo.__ISystemSupportInfoStatics2 := ISystemSupportInfoStatics2(factoryPtr)
        }

        return SystemSupportInfo.__ISystemSupportInfoStatics2.get_LocalDeviceInfo()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
