#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NtmsObjectsTypes enumeration type specifies the types of RSM objects.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ne-ntmsapi-ntmsobjectstypes
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsObjectsTypes extends Win32Enum {

    /**
     * Unknown  object.
     * Native name: NTMS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Used internally when initializing an object.
     * Native name: NTMS_OBJECT
     * @type {Integer (Int32)}
     */
    static OBJECT => 1

    /**
     * Changer.
     * Native name: NTMS_CHANGER
     * @type {Integer (Int32)}
     */
    static CHANGER => 2

    /**
     * Changer type.
     * Native name: NTMS_CHANGER_TYPE
     * @type {Integer (Int32)}
     */
    static CHANGER_TYPE => 3

    /**
     * Computer.
     * Native name: NTMS_COMPUTER
     * @type {Integer (Int32)}
     */
    static COMPUTER => 4

    /**
     * Drive.
     * Native name: NTMS_DRIVE
     * @type {Integer (Int32)}
     */
    static DRIVE => 5

    /**
     * Drive type.
     * Native name: NTMS_DRIVE_TYPE
     * @type {Integer (Int32)}
     */
    static DRIVE_TYPE => 6

    /**
     * Insert/eject door.
     * Native name: NTMS_IEDOOR
     * @type {Integer (Int32)}
     */
    static IEDOOR => 7

    /**
     * Insert/eject port.
     * Native name: NTMS_IEPORT
     * @type {Integer (Int32)}
     */
    static IEPORT => 8

    /**
     * Library (including the offline library).
     * Native name: NTMS_LIBRARY
     * @type {Integer (Int32)}
     */
    static LIBRARY => 9

    /**
     * Library request.
     * Native name: NTMS_LIBREQUEST
     * @type {Integer (Int32)}
     */
    static LIBREQUEST => 10

    /**
     * Logical media.
     * Native name: NTMS_LOGICAL_MEDIA
     * @type {Integer (Int32)}
     */
    static LOGICAL_MEDIA => 11

    /**
     * Media pool.
     * Native name: NTMS_MEDIA_POOL
     * @type {Integer (Int32)}
     */
    static MEDIA_POOL => 12

    /**
     * Media type.
     * Native name: NTMS_MEDIA_TYPE
     * @type {Integer (Int32)}
     */
    static MEDIA_TYPE => 13

    /**
     * Side of a piece of physical media.
     * Native name: NTMS_PARTITION
     * @type {Integer (Int32)}
     */
    static PARTITION => 14

    /**
     * Physical media.
     * Native name: NTMS_PHYSICAL_MEDIA
     * @type {Integer (Int32)}
     */
    static PHYSICAL_MEDIA => 15

    /**
     * Storage slot.
     * Native name: NTMS_STORAGESLOT
     * @type {Integer (Int32)}
     */
    static STORAGESLOT => 16

    /**
     * Operator request.
     * Native name: NTMS_OPREQUEST
     * @type {Integer (Int32)}
     */
    static OPREQUEST => 17

    /**
     * User interface destination.
     * Native name: NTMS_UI_DESTINATION
     * @type {Integer (Int32)}
     */
    static UI_DESTINATION => 18

    /**
     * Native name: NTMS_NUMBER_OF_OBJECT_TYPES
     * @type {Integer (Int32)}
     */
    static NUMBER_OF_OBJECT_TYPES => 19
}
