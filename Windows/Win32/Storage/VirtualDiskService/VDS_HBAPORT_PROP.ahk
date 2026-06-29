#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_HBAPORT_STATUS.ahk
#Include .\VDS_HBAPORT_TYPE.ahk
#Include .\VDS_WWN.ahk

/**
 * The VDS_HBAPORT_PROP structure (vdshwprv.h) defines the properties of an HBA port.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_hbaport_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_HBAPORT_PROP extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * The GUID assigned to the HBA port. This ID is used by the VDS service only; hardware providers should 
     *       ignore this field.
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
     * The node WWN of the HBA port.
     * @type {VDS_WWN}
     */
    wwnNode {
        get {
            if(!this.HasProp("__wwnNode"))
                this.__wwnNode := VDS_WWN(16, this)
            return this.__wwnNode
        }
    }

    /**
     * The port WWN of the HBA port.
     * @type {VDS_WWN}
     */
    wwnPort {
        get {
            if(!this.HasProp("__wwnPort"))
                this.__wwnPort := VDS_WWN(24, this)
            return this.__wwnPort
        }
    }

    /**
     * The type of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_type">VDS_HBAPORT_TYPE</a>.
     * @type {VDS_HBAPORT_TYPE}
     */
    type {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The status of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_status">VDS_HBAPORT_STATUS</a>.
     * @type {VDS_HBAPORT_STATUS}
     */
    status {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * The speed of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag">VDS_HBAPORT_SPEED_FLAG</a>.
     * @type {Integer}
     */
    ulPortSpeed {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The set of supported speeds of the HBA port, one bit set for each of the supported speeds  enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag">VDS_HBAPORT_SPEED_FLAG</a>.
     * @type {Integer}
     */
    ulSupportedPortSpeed {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
