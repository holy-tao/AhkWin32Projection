#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_NF_FILE_SYSTEM.ahk" { VDS_NF_FILE_SYSTEM }

/**
 * The VDS_FILE_SYSTEM_NOTIFICATION structure (vdshwprv.h) defines the details of file-system events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this structure as a member.
 * 
 * An application can receive file-system events by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_file_system_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_FILE_SYSTEM_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_FILE_SYSTEM

    /**
     * The GUID of the volume object containing the file system that triggered the event.
     */
    volumeId : Guid

    /**
     * The completed format progress as a percentage of the whole.
     */
    dwPercentCompleted : UInt32

}
