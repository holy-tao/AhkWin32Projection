#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_NF_DRIVE.ahk" { VDS_NF_DRIVE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_DRIVE_NOTIFICATION structure (vdshwprv.h) defines the details of drive events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this structure as a member.
 * 
 * An application can receive drive events by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
 * 
 * To get the drive object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-getproperties">IVdsDrive::GetProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive2-getproperties2">IVdsDrive2::GetProperties2</a> method to get the drive properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_drive_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DRIVE_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_DRIVE

    /**
     * The GUID of the drive that triggered the event.
     */
    driveId : Guid

}
