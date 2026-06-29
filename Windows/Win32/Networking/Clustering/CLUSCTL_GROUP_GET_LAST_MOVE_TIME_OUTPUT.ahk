#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * Specifies information about the last time a group was moved to another node.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusctl_group_get_last_move_time_output
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSCTL_GROUP_GET_LAST_MOVE_TIME_OUTPUT {
    #StructPack 8

    /**
     * The number of milliseconds that have elapsed in the owning node, when the group was moved.
     */
    GetTickCount64 : Int64

    /**
     * The system date and time in the owning node, when the group was moved.
     */
    GetSystemTime : SYSTEMTIME

    /**
     * The unique ID of the node that owns the group.
     */
    NodeId : UInt32

}
