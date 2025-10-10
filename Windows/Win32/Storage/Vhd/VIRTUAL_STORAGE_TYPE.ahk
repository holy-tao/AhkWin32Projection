#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the type and provider (vendor) of the virtual storage device.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-virtual_storage_type
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class VIRTUAL_STORAGE_TYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Device type identifier.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN"></a><a id="virtual_storage_type_device_unknown"></a><dl>
     * <dt><b>VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device type is unknown or not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIRTUAL_STORAGE_TYPE_DEVICE_ISO"></a><a id="virtual_storage_type_device_iso"></a><dl>
     * <dt><b>VIRTUAL_STORAGE_TYPE_DEVICE_ISO</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CD or DVD image file device type. (.iso file)
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIRTUAL_STORAGE_TYPE_DEVICE_VHD"></a><a id="virtual_storage_type_device_vhd"></a><dl>
     * <dt><b>VIRTUAL_STORAGE_TYPE_DEVICE_VHD</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Virtual hard disk device type. (.vhd file)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIRTUAL_STORAGE_TYPE_DEVICE_VHDX"></a><a id="virtual_storage_type_device_vhdx"></a><dl>
     * <dt><b>VIRTUAL_STORAGE_TYPE_DEVICE_VHDX</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VHDX format virtual hard disk device type. (.vhdx file)
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Vendor-unique identifier.
     * @type {Pointer<Guid>}
     */
    VendorId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
