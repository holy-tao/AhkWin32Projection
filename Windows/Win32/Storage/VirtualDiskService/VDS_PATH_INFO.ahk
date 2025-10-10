#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PATH_ID.ahk

/**
 * Defines the information for a LUN path. This structure is returned in the ppPaths parameter of the IVdsLunMpio::GetPathInfo method.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_path_info
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PATH_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The unique ID of the path used by MPIO.
     * @type {VDS_PATH_ID}
     */
    pathId{
        get {
            if(!this.HasProp("__pathId"))
                this.__pathId := VDS_PATH_ID(this.ptr + 0)
            return this.__pathId
        }
    }

    /**
     * The type of interconnect that the hardware provider supports for this LUN path. <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWT_HYBRID</a> is not a valid value for this member, even if the provider is a hybrid provider.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The status of the path, enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_path_status">VDS_PATH_STATUS</a>.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Pointer<Guid>}
     */
    controllerPortId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    targetPortalId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    hbaPortId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Guid>}
     */
    initiatorAdapterId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<VDS_HBAPORT_PROP>}
     */
    pHbaPortProp {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<VDS_IPADDRESS>}
     */
    pInitiatorPortalIpAddr {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
