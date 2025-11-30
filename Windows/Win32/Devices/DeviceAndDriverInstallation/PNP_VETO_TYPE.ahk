#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * If the PnP manager rejects a request to perform an operation, the PNP_VETO_TYPE enumeration is used to identify the reason for the rejection.
 * @remarks
 * 
 * Text strings are associated with most of the veto types, and a function that receives a veto type value can typically request to also receive the value's associated text string. The following table identifies the text string associated with each value.
 * 
 * <table>
 * <tr>
 * <th>pVeto type value</th>
 * <th>Text String</th>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoTypeUnknown</b>
 * 
 * </td>
 * <td>
 * None.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoLegacyDevice
 *        </b>
 * 
 * </td>
 * <td>
 * A device instance path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoPendingClose
 *        </b>
 * 
 * </td>
 * <td>
 * A device instance path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoWindowsApp</b>
 * 
 * </td>
 * <td>
 * An application module name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoWindowsService
 *        </b>
 * 
 * </td>
 * <td>
 * A Windows service name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoOutstandingOpen
 *        </b>
 * 
 * </td>
 * <td>
 * A device instance path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoDevice
 *        </b>
 * 
 * </td>
 * <td>
 * A device instance path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoDriver
 *        </b>
 * 
 * </td>
 * <td>
 * A driver name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoIllegalDeviceRequest</b>
 * 
 * </td>
 * <td>
 * A device instance path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoInsufficientPower
 *        </b>
 * 
 * </td>
 * <td>
 * None.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoNonDisableable</b>
 * 
 * </td>
 * <td>
 * A device instance path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>PNP_VetoLegacyDriver
 *        </b>
 * 
 * </td>
 * <td>
 * A Windows service name.
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfg/ne-cfg-pnp_veto_type
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class PNP_VETO_TYPE extends Win32Enum{

    /**
     * The specified operation was rejected for an unknown reason.
     * @type {Integer (Int32)}
     */
    static PNP_VetoTypeUnknown => 0

    /**
     * The device does not support the specified PnP operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoLegacyDevice => 1

    /**
     * The specified operation cannot be completed because of a pending close operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoPendingClose => 2

    /**
     * A Microsoft Win32 application vetoed the specified operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoWindowsApp => 3

    /**
     * A Win32 service vetoed the specified operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoWindowsService => 4

    /**
     * The requested operation was rejected because of outstanding open handles.
     * @type {Integer (Int32)}
     */
    static PNP_VetoOutstandingOpen => 5

    /**
     * The device supports the specified operation, but the device rejected the operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoDevice => 6

    /**
     * The driver supports the specified operation, but the driver rejected the operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoDriver => 7

    /**
     * The device does not support the specified operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoIllegalDeviceRequest => 8

    /**
     * There is insufficient power to perform the requested operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoInsufficientPower => 9

    /**
     * The device cannot be disabled.
     * @type {Integer (Int32)}
     */
    static PNP_VetoNonDisableable => 10

    /**
     * The driver does not support the specified PnP operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoLegacyDriver => 11

    /**
     * The caller has insufficient privileges to complete the operation.
     * @type {Integer (Int32)}
     */
    static PNP_VetoInsufficientRights => 12

    /**
     * @type {Integer (Int32)}
     */
    static PNP_VetoAlreadyRemoved => 13
}
