#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_NF_DISK.ahk" { VDS_NF_DISK }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_DISK_NOTIFICATION structure (vdshwprv.h) defines the details of disk events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive disk events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * 
 * To get the disk object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-getproperties">IVdsDisk::GetProperties</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk3-getproperties2">IVdsDisk3::GetProperties2</a> method to get the disk properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_disk_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_DISK_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_DISK

    /**
     * The GUID of the disk object that triggered the event.
     */
    diskId : Guid

}
