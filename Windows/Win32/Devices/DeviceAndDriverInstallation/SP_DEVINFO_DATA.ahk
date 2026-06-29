#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * An SP_DEVINFO_DATA structure defines a device instance that is a member of a device information set.
 * @remarks
 * An SP_DEVINFO_DATA structure identifies a device in a device information set. For example, when Windows sends a <a href="https://docs.microsoft.com/windows-hardware/drivers/install/dif-installdevice">DIF_INSTALLDEVICE</a> request to a class installer and co-installers, it includes a handle to a device information set and a pointer to an SP_DEVINFO_DATA that specifies the particular device. In addition to DIF requests, this structure is also used in some <b>SetupDi</b><i>Xxx</i> functions.
 * 
 * <b>SetupDi</b><i>Xxx</i> functions that take an SP_DEVINFO_DATA structure as a parameter verify that the <b>cbSize</b> member of the supplied structure is equal to the size, in bytes, of the structure. If the <b>cbSize</b> member is not set correctly for an input parameter, the function will fail and set an error code of ERROR_INVALID_PARAMETER. If the <b>cbSize</b> member is not set correctly for an output parameter, the function will fail and set an error code of ERROR_INVALID_USER_BUFFER.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinfo_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_DEVINFO_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of the SP_DEVINFO_DATA structure. For more information, see the following Remarks section.
     */
    cbSize : UInt32 := this.Size

    /**
     * The GUID of the device's setup class.
     */
    ClassGuid : Guid

    /**
     * An opaque handle to the device instance (also known as a handle to the <a href="https://docs.microsoft.com/windows-hardware/drivers/">devnode</a>). 
     * 
     * Some functions, such as <b>SetupDi</b><i>Xxx</i> functions, take the whole SP_DEVINFO_DATA structure as input to identify a device in a device information set. Other functions, such as <b>CM</b>_<i>Xxx</i> functions like <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_get_devnode_status">CM_Get_DevNode_Status</a>, take this <b>DevInst</b> handle as input.
     */
    DevInst : UInt32

    /**
     * Reserved. For internal use only.
     */
    Reserved : IntPtr

}
