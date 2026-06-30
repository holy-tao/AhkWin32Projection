#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PATH_STATUS.ahk
#Include .\VDS_IPADDRESS.ahk
#Include .\VDS_PATH_ID.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_HBAPORT_PROP.ahk
#Include .\VDS_HWPROVIDER_TYPE.ahk

/**
 * The VDS_PATH_INFO structure (vdshwprv.h) defines the information for a LUN path and is returned in the ppPaths parameter of the IVdsLunMpio::GetPathInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_path_info
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_PATH_INFO extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * The unique ID of the path used by MPIO.
     * @type {VDS_PATH_ID}
     */
    pathId {
        get {
            if(!this.HasProp("__pathId"))
                this.__pathId := VDS_PATH_ID(0, this)
            return this.__pathId
        }
    }

    /**
     * The type of interconnect that the hardware provider supports for this LUN path. <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWT_HYBRID</a> is not a valid value for this member, even if the provider is a hybrid provider.
     * @type {VDS_HWPROVIDER_TYPE}
     */
    type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The status of the path, enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_path_status">VDS_PATH_STATUS</a>.
     * @type {VDS_PATH_STATUS}
     */
    status {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Guid}
     */
    controllerPortId {
        get {
            if(!this.HasProp("__controllerPortId"))
                this.__controllerPortId := Guid(24, this)
            return this.__controllerPortId
        }
    }

    /**
     * @type {Guid}
     */
    targetPortalId {
        get {
            if(!this.HasProp("__targetPortalId"))
                this.__targetPortalId := Guid(24, this)
            return this.__targetPortalId
        }
    }

    /**
     * @type {Guid}
     */
    hbaPortId {
        get {
            if(!this.HasProp("__hbaPortId"))
                this.__hbaPortId := Guid(40, this)
            return this.__hbaPortId
        }
    }

    /**
     * @type {Guid}
     */
    initiatorAdapterId {
        get {
            if(!this.HasProp("__initiatorAdapterId"))
                this.__initiatorAdapterId := Guid(40, this)
            return this.__initiatorAdapterId
        }
    }

    /**
     * @type {Pointer<VDS_HBAPORT_PROP>}
     */
    pHbaPortProp {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<VDS_IPADDRESS>}
     */
    pInitiatorPortalIpAddr {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
