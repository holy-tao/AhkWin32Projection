#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_NF_PORT.ahk" { VDS_NF_PORT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_PORT_NOTIFICATION structure (vdshwprv.h) defines the details of controller port events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this 
 *     structure as a member.
 * 
 * An application can receive disk events by implementing the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface 
 *     pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> 
 *     method.
 * 
 * To get the port object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontrollerport-getproperties">IVdsControllerPort::GetProperties</a> method to get the port properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_port_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PORT_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_PORT

    /**
     * The <b>VDS_OBJECT_ID</b> of the controller port that triggered the event.
     */
    portId : Guid

}
