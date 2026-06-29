#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the type and provider (vendor) of the virtual storage device.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct VIRTUAL_STORAGE_TYPE {
    #StructPack 4

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
     */
    DeviceId : UInt32

    /**
     * Vendor-unique identifier.
     */
    VendorId : Guid

}
