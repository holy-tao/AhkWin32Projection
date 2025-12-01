#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PATH_ID.ahk

/**
 * The VDS_PATH_POLICY structure (vdshwprv.h) defines the load balance policy as it applies to a particular path.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_path_policy
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PATH_POLICY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The ID of the path used by MPIO.
     * @type {VDS_PATH_ID}
     */
    pathId{
        get {
            if(!this.HasProp("__pathId"))
                this.__pathId := VDS_PATH_ID(0, this)
            return this.__pathId
        }
    }

    /**
     * If set, indicates that the path is a primary path for MPIO.
     * @type {BOOL}
     */
    bPrimaryPath {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The weight assigned to the path. This is only relevant if the load balance policy for the LUN is 
     *       <b>VDS_LBP_WEIGHTED_PATHS</b>.
     * @type {Integer}
     */
    ulWeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
