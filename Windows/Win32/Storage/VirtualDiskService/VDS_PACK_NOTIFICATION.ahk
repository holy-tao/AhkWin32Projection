#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_NF_PACK.ahk" { VDS_NF_PACK }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_PACK_NOTIFICATION structure (vdshwprv.h) defines the details of pack events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive pack events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
 * 
 * To get the pack object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-getproperties">IVdsPack::GetProperties</a> method to get the pack properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_pack_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PACK_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_PACK

    /**
     * The GUID for the pack that triggered the event.
     */
    packId : Guid

}
