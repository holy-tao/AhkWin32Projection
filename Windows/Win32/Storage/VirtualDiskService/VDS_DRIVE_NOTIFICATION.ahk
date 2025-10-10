#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the details of drive events.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this structure as a member.
  * 
  * An application can receive drive events by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
  * 
  * To get the drive object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-getproperties">IVdsDrive::GetProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive2-getproperties2">IVdsDrive2::GetProperties2</a> method to get the drive properties.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_drive_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The GUID of the drive that triggered the event.
     * @type {Pointer<Guid>}
     */
    driveId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
