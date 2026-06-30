#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_NF_FILE_SYSTEM.ahk

/**
 * The VDS_FILE_SYSTEM_NOTIFICATION structure (vdshwprv.h) defines the details of file-system events.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> structure includes this structure as a member.
 * 
 * An application can receive file-system events by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface and passing the interface pointer as an argument to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_file_system_notification
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_FILE_SYSTEM_NOTIFICATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {VDS_NF_FILE_SYSTEM}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The GUID of the volume object containing the file system that triggered the event.
     * @type {Guid}
     */
    volumeId {
        get {
            if(!this.HasProp("__volumeId"))
                this.__volumeId := Guid(4, this)
            return this.__volumeId
        }
    }

    /**
     * The completed format progress as a percentage of the whole.
     * @type {Integer}
     */
    dwPercentCompleted {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
