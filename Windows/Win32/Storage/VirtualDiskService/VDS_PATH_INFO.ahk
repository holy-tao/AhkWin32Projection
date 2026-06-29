#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_HBAPORT_PROP.ahk" { VDS_HBAPORT_PROP }
#Import ".\VDS_HWPROVIDER_TYPE.ahk" { VDS_HWPROVIDER_TYPE }
#Import ".\VDS_PATH_ID.ahk" { VDS_PATH_ID }
#Import ".\VDS_IPADDRESS.ahk" { VDS_IPADDRESS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_PATH_STATUS.ahk" { VDS_PATH_STATUS }

/**
 * The VDS_PATH_INFO structure (vdshwprv.h) defines the information for a LUN path and is returned in the ppPaths parameter of the IVdsLunMpio::GetPathInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_path_info
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PATH_INFO {
    #StructPack 8

    /**
     * The unique ID of the path used by MPIO.
     */
    pathId : VDS_PATH_ID

    /**
     * The type of interconnect that the hardware provider supports for this LUN path. <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWT_HYBRID</a> is not a valid value for this member, even if the provider is a hybrid provider.
     */
    type : VDS_HWPROVIDER_TYPE

    /**
     * The status of the path, enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_path_status">VDS_PATH_STATUS</a>.
     */
    status : VDS_PATH_STATUS

    controllerPortId : Guid

    hbaPortId : Guid

    pHbaPortProp : VDS_HBAPORT_PROP.Ptr

    static __New() {
        DefineProp(this.Prototype, 'targetPortalId', { type: Guid, offset: 24 })
        DefineProp(this.Prototype, 'initiatorAdapterId', { type: Guid, offset: 40 })
        DefineProp(this.Prototype, 'pInitiatorPortalIpAddr', { type: VDS_IPADDRESS.Ptr, offset: 56 })
        this.DeleteProp("__New")
    }
}
