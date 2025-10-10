#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a unique identification for a path.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_path_id
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PATH_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The source ID for the path. If this is an 
     *       MPIO path, the source ID is the unique DSM ID.
     * @type {Integer}
     */
    ullSourceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The ID of the path given by the MPIO DSM.
     * @type {Integer}
     */
    ullPathId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
