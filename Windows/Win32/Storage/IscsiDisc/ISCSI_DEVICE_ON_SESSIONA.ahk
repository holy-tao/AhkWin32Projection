#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCSI_ADDRESS.ahk
#Include ..\..\System\Ioctl\STORAGE_DEVICE_NUMBER.ahk

/**
 * ISCSI_DEVICE_ON_SESSION structure specifies multiple methods for identifying a device associated with an iSCSI login session.
 * @remarks
 * 
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_DEVICE_ON_SESSION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ns-iscsidsc-iscsi_device_on_sessiona
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset ANSI
 */
class ISCSI_DEVICE_ON_SESSIONA extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 8

    /**
     * A string that indicates the initiator name.
     * @type {String}
     */
    InitiatorName {
        get => StrGet(this.ptr + 0, 255, "UTF-8")
        set => StrPut(value, this.ptr + 0, 255, "UTF-8")
    }

    /**
     * A string that indicates the target name.
     * @type {String}
     */
    TargetName {
        get => StrGet(this.ptr + 256, 223, "UTF-8")
        set => StrPut(value, this.ptr + 256, 223, "UTF-8")
    }

    /**
     * A SCSI_ADDRESS structure that contains the SCSI address of the device.
     * @type {SCSI_ADDRESS}
     */
    ScsiAddress{
        get {
            if(!this.HasProp("__ScsiAddress"))
                this.__ScsiAddress := SCSI_ADDRESS(480, this)
            return this.__ScsiAddress
        }
    }

    /**
     * A GUID that specifies the device interface class associated with the device. Device interface class GUIDs include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Type of Device</th>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_DISK</td>
     * <td>Disk</td>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_TAPE</td>
     * <td>Tape</td>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_CDROM</td>
     * <td>CD-ROM</td>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_WRITEONCEDISK</td>
     * <td>Write Once Disk</td>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_CDCHANGER</td>
     * <td>CD Changer</td>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_MEDIUMCHANGER</td>
     * <td>Medium Changer</td>
     * </tr>
     * <tr>
     * <td>GUID_DEVINTERFACE_FLOPPY</td>
     * <td>Floppy</td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    DeviceInterfaceType {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * A string that specifies the name of the device interface class.
     * @type {String}
     */
    DeviceInterfaceName {
        get => StrGet(this.ptr + 496, 259, "UTF-8")
        set => StrPut(value, this.ptr + 496, 259, "UTF-8")
    }

    /**
     * A string that specifies the legacy device name.
     * @type {String}
     */
    LegacyName {
        get => StrGet(this.ptr + 756, 259, "UTF-8")
        set => StrPut(value, this.ptr + 756, 259, "UTF-8")
    }

    /**
     * A <b>STORAGE_DEVICE_NUMBER</b> structure containing the storage device number.
     * @type {STORAGE_DEVICE_NUMBER}
     */
    StorageDeviceNumber{
        get {
            if(!this.HasProp("__StorageDeviceNumber"))
                this.__StorageDeviceNumber := STORAGE_DEVICE_NUMBER(1016, this)
            return this.__StorageDeviceNumber
        }
    }

    /**
     * A handle to the instance of the device in the devnode tree. For information on the cfgmgr32Xxx functions that utilize this handle, see PnP Configuration Manager Functions.
     * @type {Integer}
     */
    DeviceInstance {
        get => NumGet(this, 1028, "uint")
        set => NumPut("uint", value, this, 1028)
    }
}
