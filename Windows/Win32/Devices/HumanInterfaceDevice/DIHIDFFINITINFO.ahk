#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DIHIDFFINITINFO structure is used by DirectInput to provide information to a HID force-feedback driver about the device it is being asked to control.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-dihidffinitinfo
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIHIDFFINITINFO {
    #StructPack 8

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Points to a null-terminated Unicode string that identifies the device interface for the device. The driver can pass the device interface to the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to obtain access to the device.
     */
    pwszDeviceInterface : PWSTR

    /**
     * Specifies a device instance GUID for this device.
     */
    GuidInstance : Guid

}
