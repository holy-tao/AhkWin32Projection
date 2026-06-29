#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * An SP_DEVICE_INTERFACE_DATA structure defines a device interface in a device information set.
 * @remarks
 * A SetupAPI function that takes an instance of the SP_DEVICE_INTERFACE_DATA structure as a parameter verifies whether the <b>cbSize</b> member of the supplied structure is equal to the size, in bytes, of the structure. If the <b>cbSize</b> member is not set correctly, the function will fail and set an error code of ERROR_INVALID_USER_BUFFER.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_device_interface_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_DEVICE_INTERFACE_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of the SP_DEVICE_INTERFACE_DATA structure. For more information, see the Remarks section.
     */
    cbSize : UInt32 := this.Size

    /**
     * The GUID for the class to which the device interface belongs.
     */
    InterfaceClassGuid : Guid

    /**
     * Can be one or more of the following:
     */
    Flags : UInt32

    /**
     * Reserved. Do not use.
     */
    Reserved : IntPtr

}
