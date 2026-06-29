#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_PATH_ID structure (vdshwprv.h) defines a unique identification for a path.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_path_id
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PATH_ID {
    #StructPack 8

    /**
     * The source ID for the path. If this is an 
     *       MPIO path, the source ID is the unique DSM ID.
     */
    ullSourceId : Int64

    /**
     * The ID of the path given by the MPIO DSM.
     */
    ullPathId : Int64

}
