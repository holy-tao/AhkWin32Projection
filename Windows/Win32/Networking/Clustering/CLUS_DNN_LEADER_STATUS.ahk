#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents the status of a Distributed Network Name (DNN) resource for a Scale-Out File Server.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_dnn_leader_status
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_DNN_LEADER_STATUS {
    #StructPack 4

    /**
     * <b>TRUE</b> if the Distributed Network Name (DNN) resource for the Scale-Out File Server  is online; otherwise <b>FALSE</b>.
     */
    IsOnline : BOOL

    /**
     * <b>TRUE</b> if the file server is running; otherwise <b>FALSE</b>.
     */
    IsFileServerPresent : BOOL

}
