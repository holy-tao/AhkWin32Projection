#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_NF_LUN.ahk" { VDS_NF_LUN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_LUN_NOTIFICATION structure (vdshwprv.h) defines the details of a LUN notification.
 * @remarks
 * This structure is included as a member in the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure.
 * 
 * An application can receive LUN events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
 * 
 * To get the LUN object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method to get the LUN properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_lun_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_LUN_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_LUN

    /**
     * The GUID of the LUN.
     */
    LunId : Guid

}
