#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * If the PnP manager rejects a request to perform an operation, the PNP_VETO_TYPE enumeration is used to identify the reason for the rejection.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/cfg/ne-cfg-pnp_veto_type
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class PNP_VETO_TYPE extends Win32Enum {

    /**
     * The specified operation was rejected for an unknown reason.
     * Native name: PNP_VetoTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The device does not support the specified PnP operation.
     * Native name: PNP_VetoLegacyDevice
     * @type {Integer (Int32)}
     */
    static LegacyDevice => 1

    /**
     * The specified operation cannot be completed because of a pending close operation.
     * Native name: PNP_VetoPendingClose
     * @type {Integer (Int32)}
     */
    static PendingClose => 2

    /**
     * A Microsoft Win32 application vetoed the specified operation.
     * Native name: PNP_VetoWindowsApp
     * @type {Integer (Int32)}
     */
    static WindowsApp => 3

    /**
     * A Win32 service vetoed the specified operation.
     * Native name: PNP_VetoWindowsService
     * @type {Integer (Int32)}
     */
    static WindowsService => 4

    /**
     * The requested operation was rejected because of outstanding open handles.
     * Native name: PNP_VetoOutstandingOpen
     * @type {Integer (Int32)}
     */
    static OutstandingOpen => 5

    /**
     * The device supports the specified operation, but the device rejected the operation.
     * Native name: PNP_VetoDevice
     * @type {Integer (Int32)}
     */
    static Device => 6

    /**
     * The driver supports the specified operation, but the driver rejected the operation.
     * Native name: PNP_VetoDriver
     * @type {Integer (Int32)}
     */
    static Driver => 7

    /**
     * The device does not support the specified operation.
     * Native name: PNP_VetoIllegalDeviceRequest
     * @type {Integer (Int32)}
     */
    static IllegalDeviceRequest => 8

    /**
     * There is insufficient power to perform the requested operation.
     * Native name: PNP_VetoInsufficientPower
     * @type {Integer (Int32)}
     */
    static InsufficientPower => 9

    /**
     * The device cannot be disabled.
     * Native name: PNP_VetoNonDisableable
     * @type {Integer (Int32)}
     */
    static NonDisableable => 10

    /**
     * The driver does not support the specified PnP operation.
     * Native name: PNP_VetoLegacyDriver
     * @type {Integer (Int32)}
     */
    static LegacyDriver => 11

    /**
     * The caller has insufficient privileges to complete the operation.
     * Native name: PNP_VetoInsufficientRights
     * @type {Integer (Int32)}
     */
    static InsufficientRights => 12

    /**
     * Native name: PNP_VetoAlreadyRemoved
     * @type {Integer (Int32)}
     */
    static AlreadyRemoved => 13
}
