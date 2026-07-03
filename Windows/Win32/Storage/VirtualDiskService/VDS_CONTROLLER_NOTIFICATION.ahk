#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_NF_CONTROLLER.ahk" { VDS_NF_CONTROLLER }

/**
 * The VDS_CONTROLLER_NOTIFICATION structure (vdshwprv.h) defines the details of controller events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this structure as a member.
 * 
 * An application can receive controller events by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
 * 
 * To get the controller object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getproperties">IVdsController::GetProperties</a> method to get the controller properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_controller_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_CONTROLLER_NOTIFICATION {
    #StructPack 4

    ulEvent : VDS_NF_CONTROLLER

    /**
     * The GUID of the controller that triggered the event.
     */
    controllerId : Guid

}
