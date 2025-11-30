#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NtmsObjectsTypes enumeration type specifies the types of RSM objects.
 * @remarks
 * 
 * The following table show the relationship of RSM objects.
 * 
 * <table>
 * <tr>
 * <th>Container</th>
 * <th>Object</th>
 * </tr>
 * <tr>
 * <td>Library</td>
 * <td>Changer</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Door</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Drive</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Library request</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Media type</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Physical media</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Port</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Slot</td>
 * </tr>
 * <tr>
 * <td>Logical media</td>
 * <td>Side</td>
 * </tr>
 * <tr>
 * <td>Media pool</td>
 * <td>Logical media</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Media pool</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Physical media</td>
 * </tr>
 * <tr>
 * <td>NULL</td>
 * <td>Changer</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Changer type</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Computer</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Door</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Drive</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Drive type</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Library</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Library request</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Logical media</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Media pool (free, unrecognized, import, and application root)</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Media type</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Operator request</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Port</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Physical media</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Side</td>
 * </tr>
 * <tr>
 * <td>Physical Media</td>
 * <td>Side</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ne-ntmsapi-ntmsobjectstypes
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsObjectsTypes extends Win32Enum{

    /**
     * Unknown  object.
     * @type {Integer (Int32)}
     */
    static NTMS_UNKNOWN => 0

    /**
     * Used internally when initializing an object.
     * @type {Integer (Int32)}
     */
    static NTMS_OBJECT => 1

    /**
     * Changer.
     * @type {Integer (Int32)}
     */
    static NTMS_CHANGER => 2

    /**
     * Changer type.
     * @type {Integer (Int32)}
     */
    static NTMS_CHANGER_TYPE => 3

    /**
     * Computer.
     * @type {Integer (Int32)}
     */
    static NTMS_COMPUTER => 4

    /**
     * Drive.
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVE => 5

    /**
     * Drive type.
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVE_TYPE => 6

    /**
     * Insert/eject door.
     * @type {Integer (Int32)}
     */
    static NTMS_IEDOOR => 7

    /**
     * Insert/eject port.
     * @type {Integer (Int32)}
     */
    static NTMS_IEPORT => 8

    /**
     * Library (including the offline library).
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARY => 9

    /**
     * Library request.
     * @type {Integer (Int32)}
     */
    static NTMS_LIBREQUEST => 10

    /**
     * Logical media.
     * @type {Integer (Int32)}
     */
    static NTMS_LOGICAL_MEDIA => 11

    /**
     * Media pool.
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIA_POOL => 12

    /**
     * Media type.
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIA_TYPE => 13

    /**
     * Side of a piece of physical media.
     * @type {Integer (Int32)}
     */
    static NTMS_PARTITION => 14

    /**
     * Physical media.
     * @type {Integer (Int32)}
     */
    static NTMS_PHYSICAL_MEDIA => 15

    /**
     * Storage slot.
     * @type {Integer (Int32)}
     */
    static NTMS_STORAGESLOT => 16

    /**
     * Operator request.
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQUEST => 17

    /**
     * User interface destination.
     * @type {Integer (Int32)}
     */
    static NTMS_UI_DESTINATION => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NTMS_NUMBER_OF_OBJECT_TYPES => 19
}
