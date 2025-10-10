#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the details of controller events.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this structure as a member.
  * 
  * An application can receive controller events by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
  * 
  * To get the controller object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getproperties">IVdsController::GetProperties</a> method to get the controller properties.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_controller_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_CONTROLLER_NOTIFICATION extends Win32Struct
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
     * The GUID of the controller that triggered the event.
     * @type {Pointer<Guid>}
     */
    controllerId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
