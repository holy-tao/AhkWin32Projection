#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_WWN.ahk

/**
 * Defines the properties of an HBA port.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_hbaport_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HBAPORT_PROP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The GUID assigned to the HBA port. This ID is used by the VDS service only; hardware providers should 
     *       ignore this field.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The node WWN of the HBA port.
     * @type {VDS_WWN}
     */
    wwnNode{
        get {
            if(!this.HasProp("__wwnNode"))
                this.__wwnNode := VDS_WWN(this.ptr + 8)
            return this.__wwnNode
        }
    }

    /**
     * The port WWN of the HBA port.
     * @type {VDS_WWN}
     */
    wwnPort{
        get {
            if(!this.HasProp("__wwnPort"))
                this.__wwnPort := VDS_WWN(this.ptr + 16)
            return this.__wwnPort
        }
    }

    /**
     * The type of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_type">VDS_HBAPORT_TYPE</a>.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The status of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_status">VDS_HBAPORT_STATUS</a>.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The speed of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag">VDS_HBAPORT_SPEED_FLAG</a>.
     * @type {Integer}
     */
    ulPortSpeed {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The set of supported speeds of the HBA port, one bit set for each of the supported speeds  enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag">VDS_HBAPORT_SPEED_FLAG</a>.
     * @type {Integer}
     */
    ulSupportedPortSpeed {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
