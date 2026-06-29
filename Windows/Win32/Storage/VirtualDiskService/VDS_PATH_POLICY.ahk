#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PATH_ID.ahk" { VDS_PATH_ID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The VDS_PATH_POLICY structure (vdshwprv.h) defines the load balance policy as it applies to a particular path.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_path_policy
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PATH_POLICY {
    #StructPack 8

    /**
     * The ID of the path used by MPIO.
     */
    pathId : VDS_PATH_ID

    /**
     * If set, indicates that the path is a primary path for MPIO.
     */
    bPrimaryPath : BOOL

    /**
     * The weight assigned to the path. This is only relevant if the load balance policy for the LUN is 
     *       <b>VDS_LBP_WEIGHTED_PATHS</b>.
     */
    ulWeight : UInt32

}
