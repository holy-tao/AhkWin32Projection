#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An SP_DEVINFO_DATA structure defines a device instance that is a member of a device information set.
 * @remarks
 * An SP_DEVINFO_DATA structure identifies a device in a device information set. For example, when Windows sends a <a href="https://docs.microsoft.com/windows-hardware/drivers/install/dif-installdevice">DIF_INSTALLDEVICE</a> request to a class installer and co-installers, it includes a handle to a device information set and a pointer to an SP_DEVINFO_DATA that specifies the particular device. In addition to DIF requests, this structure is also used in some <b>SetupDi</b><i>Xxx</i> functions.
  * 
  * <b>SetupDi</b><i>Xxx</i> functions that take an SP_DEVINFO_DATA structure as a parameter verify that the <b>cbSize</b> member of the supplied structure is equal to the size, in bytes, of the structure. If the <b>cbSize</b> member is not set correctly for an input parameter, the function will fail and set an error code of ERROR_INVALID_PARAMETER. If the <b>cbSize</b> member is not set correctly for an output parameter, the function will fail and set an error code of ERROR_INVALID_USER_BUFFER.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinfo_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_DEVINFO_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * The size, in bytes, of the SP_DEVINFO_DATA structure. For more information, see the following Remarks section.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The GUID of the device's setup class.
     * @type {Pointer<Guid>}
     */
    ClassGuid {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * An opaque handle to the device instance (also known as a handle to the <a href="https://docs.microsoft.com/windows-hardware/drivers/">devnode</a>). 
     * 
     * Some functions, such as <b>SetupDi</b><i>Xxx</i> functions, take the whole SP_DEVINFO_DATA structure as input to identify a device in a device information set. Other functions, such as <b>CM</b>_<i>Xxx</i> functions like <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_get_devnode_status">CM_Get_DevNode_Status</a>, take this <b>DevInst</b> handle as input.
     * @type {Integer}
     */
    DevInst {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved. For internal use only.
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
