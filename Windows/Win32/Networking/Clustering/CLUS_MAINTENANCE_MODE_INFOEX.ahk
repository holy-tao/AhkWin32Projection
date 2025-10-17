#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the extended maintenance mode settings for a storage class resource.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_maintenance_mode_infoex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_MAINTENANCE_MODE_INFOEX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Set to <b>TRUE</b> to enable or <b>FALSE</b> to disable maintenance 
     *       mode for the identified resource.
     *       When queried, a resource will return <b>True</b> or <b>False</b> to 
     *        indicate the current maintenance mode state of the resource.
     * @type {BOOL}
     */
    InMaintenance {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Unless the resource in question is in a type of maintenance mode, this member is set to 0.  Otherwise this member  takes an <b>enumerator</b> from the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-maintenance_mode_type_enum">MAINTENANCE_MODE_TYPE_ENUM</a> enumeration as its value.  The possible values of this member are as follows.
     * @type {Integer}
     */
    MaintainenceModeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * This member represents the internal resource state. This field is valid only when written by the server.  This member takes an enumerator from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration.  The possible values of this member are as follows.
     * @type {Integer}
     */
    InternalState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A 32-bit integer that must contain the value 0xABBAF00F.
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
