#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_PORT_STATUS.ahk

/**
 * The VDS_PORT_PROP structure (vdshwprv.h) defines the properties of a port on a controller object.
 * @remarks
 * The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getportproperties">IVdsController::GetPortProperties</a> 
 *     method returns this structure to report the property details of a port on a controller object.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_port_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_PORT_PROP extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the port.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * The name of the port; a zero-terminated, human-readable string.
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The port identifier or address, typically a world wide name (WWN); a zero-terminated, human-readable 
     *       string.
     * 
     * For Fibre Channel networks, this member should be the WWN for the port, formatted as a hexadecimal string (16 characters long), most significant byte first. For example, a WWN address of 01:23:45:67:89:AB:CD:EF should be represented as "0123456789ABCDEF".
     * @type {PWSTR}
     */
    pwszIdentification {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The status of the port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_port_status">VDS_PORT_STATUS</a>.
     * @type {VDS_PORT_STATUS}
     */
    status {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
