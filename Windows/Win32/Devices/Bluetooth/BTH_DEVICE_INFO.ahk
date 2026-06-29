#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores information about a Bluetooth device.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_device_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_DEVICE_INFO {
    #StructPack 8

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
     */
    flags : UInt32

    /**
     * Address of the remote Bluetooth device.
     */
    address : Int64

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
     */
    classOfDevice : UInt32

    /**
     * Name of the remote Bluetooth device, as reported by the device, encoded in UTF8.  The user may have locally provided a display name for the remote Bluetooth device; that name is overridden, and does not appear in this member; it is accessible only with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothgetdeviceinfo">BluetoothGetDeviceInfo</a> function.
     */
    name : CHAR[248]

}
