#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmbiosInformationStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables access to properties from the SMBIOS for the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.smbiosinformation
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class SmbiosInformation extends IInspectable {
;@region Static Properties
    /**
     * Gets the serial number from the SMBIOS for the system.
     * @remarks
     * The SerialNumber property securely retrieves the serial number from the SMBIOS for the system.
     * For a UWP app to access the serial number,
     * the app must possess the `smbios` capability,
     * or the app must be designated as a
     * [Privileged App](/windows-hardware/drivers/devapps/step-2--create-device-metadata)
     * by the system manufacturer.
     * 
     * System manufacturers typically use the SerialNumber property to aid in identification of devices for servicing and troubleshooting operations.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.smbiosinformation.serialnumber
     * @type {HSTRING} 
     */
    static SerialNumber {
        get => SmbiosInformation.get_SerialNumber()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SerialNumber() {
        if (!SmbiosInformation.HasProp("__ISmbiosInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemManufacturers.SmbiosInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmbiosInformationStatics.IID)
            SmbiosInformation.__ISmbiosInformationStatics := ISmbiosInformationStatics(factoryPtr)
        }

        return SmbiosInformation.__ISmbiosInformationStatics.get_SerialNumber()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
