#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information about a Bluetooth device.
 * @see https://docs.microsoft.com/windows/win32/api//bthdef/ns-bthdef-bth_device_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_DEVICE_INFO extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * A combination of one or more of the  flags listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_ADDRESS"></a><a id="bdif_address"></a><dl>
     * <dt><b>BDIF_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>address</b> member contains valid data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_COD"></a><a id="bdif_cod"></a><dl>
     * <dt><b>BDIF_COD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>classOfDevice</b> member contains valid data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_NAME"></a><a id="bdif_name"></a><dl>
     * <dt><b>BDIF_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>name</b> member contains valid data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_PAIRED"></a><a id="bdif_paired"></a><dl>
     * <dt><b>BDIF_PAIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is a remembered and authenticated device. The <b>BDIF_PERSONAL</b> flag is always set when this flag is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_PERSONAL"></a><a id="bdif_personal"></a><dl>
     * <dt><b>BDIF_PERSONAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is a remembered device. If this flag is set and the <b>BDIF_PAIRED</b> flag is not set, the device is not authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_CONNECTED"></a><a id="bdif_connected"></a><dl>
     * <dt><b>BDIF_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote Bluetooth device is currently connected to the local radio.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_SSP_SUPPORTED"></a><a id="bdif_ssp_supported"></a><dl>
     * <dt><b>BDIF_SSP_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports the use of Secure Simple Pairing (SSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_SSP_PAIRED"></a><a id="bdif_ssp_paired"></a><dl>
     * <dt><b>BDIF_SSP_PAIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is remembered and is authenticated using Secure Simple Pairing (SSP).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BDIF_SSP_MITM_PROTECTED"></a><a id="bdif_ssp_mitm_protected"></a><dl>
     * <dt><b>BDIF_SSP_MITM_PROTECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports the use of Secure Simple Pairing (SSP) to protect against "Man in the Middle" attacks.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of the remote Bluetooth device.
     * @type {Integer}
     */
    address {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Bit field that describes the device class of device (COD) of the remote device. The COD consists of the following four fields:
     * 
     * Format: retrieved using GET_COD_FORMAT(<b>classOfDevice</b>). The only format currently supported is COD_VERSION.
     * 
     * 
     * 
     * Major: retrieved using the GET_COD_MAJOR(<b>classOfDevice</b>). The following values are currently  defined, but the list is expected to expand.  Do not use the major class field to determine to which remote device to  connect.  A remote device may only have one major class code, and may not be the appropriate code for the given profile.
     * 
     * <a id="COD_MAJOR_MISCELLANEOUS"></a>
     * <a id="cod_major_miscellaneous"></a>
     * @type {Integer}
     */
    classOfDevice {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Name of the remote Bluetooth device, as reported by the device, encoded in UTF8.  The user may have locally provided a display name for the remote Bluetooth device; that name is overridden, and does not appear in this member; it is accessible only with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothgetdeviceinfo">BluetoothGetDeviceInfo</a> function.
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 20, 247, "UTF-16")
        set => StrPut(value, this.ptr + 20, 247, "UTF-16")
    }
}
