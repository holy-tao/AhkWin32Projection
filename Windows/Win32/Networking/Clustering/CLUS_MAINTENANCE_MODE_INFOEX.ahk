#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }
#Import ".\MAINTENANCE_MODE_TYPE_ENUM.ahk" { MAINTENANCE_MODE_TYPE_ENUM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents the extended maintenance mode settings for a storage class resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_maintenance_mode_infoex
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_MAINTENANCE_MODE_INFOEX {
    #StructPack 4

    /**
     * Set to <b>TRUE</b> to enable or <b>FALSE</b> to disable maintenance 
     *       mode for the identified resource.
     *       When queried, a resource will return <b>True</b> or <b>False</b> to 
     *        indicate the current maintenance mode state of the resource.
     */
    InMaintenance : BOOL

    /**
     * Unless the resource in question is in a type of maintenance mode, this member is set to 0.  Otherwise this member  takes an <b>enumerator</b> from the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-maintenance_mode_type_enum">MAINTENANCE_MODE_TYPE_ENUM</a> enumeration as its value.  The possible values of this member are as follows.
     */
    MaintainenceModeType : MAINTENANCE_MODE_TYPE_ENUM

    /**
     * This member represents the internal resource state. This field is valid only when written by the server.  This member takes an enumerator from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration.  The possible values of this member are as follows.
     */
    InternalState : CLUSTER_RESOURCE_STATE

    /**
     * A 32-bit integer that must contain the value 0xABBAF00F.
     */
    Signature : UInt32

}
