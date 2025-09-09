#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the parameters of a changer.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-get_changer_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GET_CHANGER_PARAMETERS extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * The size of this structure, in bytes. The caller must set this member to <c>sizeof(GET_CHANGER_PARAMETERS)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of transport elements in the changer. For a SCSI changer, this is defined in the element address page. This value is almost always 1, because most changers have a single transport element with one or two picker mechanisms. A changer that has two picker mechanisms on its transport must not be represented as having two transports, because pickers are not individually addressable. High-end media libraries can have dual and multiple transport elements for fault tolerance.
     * @type {Integer}
     */
    NumberTransportElements {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The number of storage elements (slots) in the changer. For a SCSI changer, this is defined in the element address page. This value represents the maximum number of slots available for this changer including those in removable magazines, whether or not the magazines are installed. If <b>NumberCleanerSlots</b> is 1, then <b>NumberStorageElements</b> is 1 less than the maximum number of slots in the changer.
     * @type {Integer}
     */
    NumberStorageElements {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The number of storage elements (slots) for cleaner cartridges in the changer. If <b>NumberCleanerSlots</b> is 1, then <b>FirstCleanerSlotAddress</b> indicates the zero-based address of the slot in which a drive cleaner should be inserted. If the changer does not support drive cleaning by programmatically moving the cleaner cartridge from its slot to a drive, <b>NumberCleanerSlots</b> is 0. <b>NumberCleanerSlots</b> cannot be greater than 1.
     * @type {Integer}
     */
    NumberCleanerSlots {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The number of import/export elements (insert/eject ports) the changer has for inserting and ejecting media. For a SCSI changer, this is defined in the element address page. An import/export element must not be part of the storage element (slot) space, and it must be possible to transport media between the import/export element and a slot using a MOVE MEDIUM command. If the changer has a door and not a true import/export element, <b>NumberIEElements</b> is 0.
     * @type {Integer}
     */
    NumberIEElements {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The number of data transfer elements (drives) in the changer. For a SCSI changer, this is defined in the element address page. Unlike <b>NumberStorageElements</b>, which indicates the total number of possible slots whether or not the slots are actually present, <b>NumberDataTransferElements</b> indicates the number of drives that are actually present in the changer.
     * @type {Integer}
     */
    NumberDataTransferElements {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The number of doors in the changer. A door provides access to all media in the changer at once, unlike an insert/eject port, which provides access to one or more, but not all, media. A changer's door can be a physical front door or a single magazine that contains all media. If a changer supports only an insert/eject port for inserting and ejecting media, <b>NumberOfDoors</b> is 0.
     * @type {Integer}
     */
    NumberOfDoors {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * The number used by the changer vendor to identify the first storage element (slot) in the changer to the end user, either by marking a magazine or by defining a slot numbering scheme in the changer's operators guide. <b>FirstSlotNumber</b> is typically 0 or 1, but it can be the first address in a consecutive range of slot addresses defined by the vendor.
     * @type {Integer}
     */
    FirstSlotNumber {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The number used by the changer vendor to identify the first data transfer element (drive) in the changer to the end user. <b>FirstDriveNumber</b> is typically 0 or 1, but it can be the first address in a consecutive range of drive addresses defined by the vendor.
     * @type {Integer}
     */
    FirstDriveNumber {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * The number used by the changer vendor to identify the first (and usually only) transport element in the changer to the end user. <b>FirstTransportNumber</b> is typically 0 or 1, but it can be the first address in a consecutive range of transport addresses defined by the vendor.
     * @type {Integer}
     */
    FirstTransportNumber {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The number used by the changer vendor to identify the first (and usually only) insert/eject port in the changer to the end user. <b>FirstIEPortNumber</b> is typically 0 or 1, but it can be the first address in a consecutive range of insert/eject port addresses defined by the vendor. If <b>NumberIEElements</b> is 0, <b>FirstIEPortNumber</b> must also be 0.
     * @type {Integer}
     */
    FirstIEPortNumber {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * The number used by the changer vendor to identify the first (and only) slot address assigned to a drive cleaner cartridge to the end user. This must be the value defined by the vendor in the changer's operators guide. For example, if a changer has 8 slots numbered 1 through 8 and its operator's guide designates slot 8 as the drive cleaner slot, <b>FirstSlotNumber</b> would be 1 and <b>FirstCleanerSlotAddress</b> would be 8. If the same 8 slots were numbered 0 through 7, <b>FirstSlotNumber</b> would be 0 and <b>FirstCleanerSlotAddress</b> would be 7. If <b>NumberCleanerSlots</b> is 0, <b>FirstCleanerSlotAddress</b> must be 0.
     * @type {Integer}
     */
    FirstCleanerSlotAddress {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The number of slots in the removable magazines in the changer. This member is valid only if CHANGER_CARTRIDGE_MAGAZINE is set in <b>Features0</b>.
     * @type {Integer}
     */
    MagazineSize {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Twice the maximum number of seconds a cleaning is expected to take. The changer's drives should be cleaned by its cleaner cartridge in half the time specified by <b>DriveCleanTimeout</b>. For example, if a drive is typically cleaned in 300 seconds (5 minutes), <b>DriveCleanTimeout</b> should be set to 600.
     * @type {Integer}
     */
    DriveCleanTimeout {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    Features0 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    Features1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Indicates whether the changer supports moving a piece of media from a transport element to another transport element, a storage slot, an insert/eject port, or a drive. For a SCSI changer, this is defined in the device capabilities page. The transport is not typically the source or destination for moving or exchanging media. 
     * 
     * 
     * 
     * 
     * To determine whether the changer can move media to a given element, use the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHANGER_TO_DRIVE"></a><a id="changer_to_drive"></a><dl>
     * <dt><b>CHANGER_TO_DRIVE</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The changer can carry out the operation from the specified element to a drive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHANGER_TO_IEPORT"></a><a id="changer_to_ieport"></a><dl>
     * <dt><b>CHANGER_TO_IEPORT</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The changer can carry out the operation from the specified element to an insert/eject port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHANGER_TO_SLOT"></a><a id="changer_to_slot"></a><dl>
     * <dt><b>CHANGER_TO_SLOT</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The changer can carry out the operation from the specified element to a storage slot.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHANGER_TO_TRANSPORT"></a><a id="changer_to_transport"></a><dl>
     * <dt><b>CHANGER_TO_TRANSPORT</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The changer can carry out the operation from the specified element to a transport.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    MoveFromTransport {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * Indicates whether the changer supports moving medium from a storage slot to a transport element, another storage slot, an insert/eject port, or a drive. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the move.
     * @type {Integer}
     */
    MoveFromSlot {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }

    /**
     * Indicates whether the changer supports moving medium from an insert/eject port to a transport element, a storage slot, another insert/eject port, or a drive. For a SCSI changer, this is defined in the device capabilities page. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the move.
     * @type {Integer}
     */
    MoveFromIePort {
        get => NumGet(this, 42, "char")
        set => NumPut("char", value, this, 42)
    }

    /**
     * Indicates whether the changer supports moving medium from a drive to a transport element, a storage slot, an insert/eject port, or another drive. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the move.
     * @type {Integer}
     */
    MoveFromDrive {
        get => NumGet(this, 43, "char")
        set => NumPut("char", value, this, 43)
    }

    /**
     * Indicates whether the changer supports exchanging medium between a transport element and another transport element, a storage slot, an insert/eject port, or a drive. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the exchange.
     * @type {Integer}
     */
    ExchangeFromTransport {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * Indicates whether the changer supports exchanging medium between a storage slot and a transport element, another storage slot, an insert/eject port, or a drive. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the exchange.
     * @type {Integer}
     */
    ExchangeFromSlot {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * Indicates whether the changer supports exchanging medium between an insert/eject port and a transport element, a storage slot, another insert/eject port, or a drive. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the exchange.
     * @type {Integer}
     */
    ExchangeFromIePort {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * Indicates whether the changer supports exchanging medium between a drive and a transport element, a storage slot, an insert/eject port, or another drive. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports the exchange.
     * @type {Integer}
     */
    ExchangeFromDrive {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * The elements of a changer that can be locked or unlocked programmatically. This member is valid only if CHANGER_LOCK_UNLOCK is set in <b>Features0</b>.
     * @type {Integer}
     */
    LockUnlockCapabilities {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * The elements to which a changer can position its transport. Use the flags described under <b>MoveFromTransport</b> to determine whether the changer supports positioning the transport to a particular element. This member is valid only if CHANGER_POSITION_TO_ELEMENT is set in <b>Features0</b>.
     * @type {Integer}
     */
    PositionCapabilities {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 50, 2, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Reserved for future use.
     * @type {Array<UInt32>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 52, 2, Primitive, "uint")
            return this.__Reserved2ProxyArray
        }
    }
}
