#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the element type of a changer device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-element_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class ELEMENT_TYPE{

    /**
     * All elements of a changer, including its robotic transport, drives, slots, and insert/eject ports. This value is valid only with 
 * [IOCTL_CHANGER_GET_ELEMENT_STATUS](ni-winioctl-ioctl_changer_get_element_status.md) or [IOCTL_CHANGER_INITIALIZE_ELEMENT_STATUS](ni-winioctl-ioctl_changer_initialize_element_status.md).
     * @type {Integer (Int32)}
     */
    static AllElements => 0

    /**
     * Robotic transport element, which is used to move media between insert/eject ports, slots, and drives.
     * @type {Integer (Int32)}
     */
    static ChangerTransport => 1

    /**
     * Storage element, which is a slot in the changer in which media is stored when not mounted in a drive.
     * @type {Integer (Int32)}
     */
    static ChangerSlot => 2

    /**
     * Insert/eject port, which is a single- or multiple-cartridge access port in some changers. An element is an insert/eject port only if it is possible to move a piece of media from a slot to the insert/eject port.
     * @type {Integer (Int32)}
     */
    static ChangerIEPort => 3

    /**
     * Data transfer element where data can be read from and written to media.
     * @type {Integer (Int32)}
     */
    static ChangerDrive => 4

    /**
     * Mechanism that provides access to all media in a changer at one time (as compared to an IEport that provides access to one or more, but not all, media). For example, a large front door or a magazine that contains all media in the changer is an element of this type. This value is valid only with [IOCTL_CHANGER_SET_ACCESS](ni-winioctl-ioctl_changer_set_access.md).
     * @type {Integer (Int32)}
     */
    static ChangerDoor => 5

    /**
     * Keypad or other input control on the front panel of a changer. This value is valid only with [IOCTL_CHANGER_SET_ACCESS](ni-winioctl-ioctl_changer_set_access.md).
     * @type {Integer (Int32)}
     */
    static ChangerKeypad => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ChangerMaxElement => 7
}
