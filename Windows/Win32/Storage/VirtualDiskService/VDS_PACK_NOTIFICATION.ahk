#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_NF_PACK.ahk

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
class VDS_PACK_NOTIFICATION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {VDS_NF_PACK}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The GUID for the pack that triggered the event.
     * @type {Guid}
     */
    packId {
        get {
            if(!this.HasProp("__packId"))
                this.__packId := Guid(4, this)
            return this.__packId
        }
    }
}
