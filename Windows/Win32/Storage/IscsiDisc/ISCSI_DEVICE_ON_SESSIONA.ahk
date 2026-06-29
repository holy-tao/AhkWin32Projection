#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_ADDRESS.ahk" { SCSI_ADDRESS }
#Import "..\..\System\Ioctl\STORAGE_DEVICE_NUMBER.ahk" { STORAGE_DEVICE_NUMBER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * ISCSI_DEVICE_ON_SESSION structure specifies multiple methods for identifying a device associated with an iSCSI login session. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_DEVICE_ON_SESSION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_device_on_sessiona
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset ANSI
 */
export default struct ISCSI_DEVICE_ON_SESSIONA {
    #StructPack 4

    /**
     * A string that indicates the initiator name.
     */
    InitiatorName : CHAR[256]

    /**
     * A string that indicates the target name.
     */
    TargetName : CHAR[224]

    /**
     * A SCSI_ADDRESS structure that contains the SCSI address of the device.
     */
    ScsiAddress : SCSI_ADDRESS

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
     */
    DeviceInterfaceType : Guid

    /**
     * A string that specifies the name of the device interface class.
     */
    DeviceInterfaceName : CHAR[260]

    /**
     * A string that specifies the legacy device name.
     */
    LegacyName : CHAR[260]

    /**
     * A <b>STORAGE_DEVICE_NUMBER</b> structure containing the storage device number.
     */
    StorageDeviceNumber : STORAGE_DEVICE_NUMBER

    /**
     * A handle to the instance of the device in the devnode tree. For information on the cfgmgr32Xxx functions that utilize this handle, see PnP Configuration Manager Functions.
     */
    DeviceInstance : UInt32

}
