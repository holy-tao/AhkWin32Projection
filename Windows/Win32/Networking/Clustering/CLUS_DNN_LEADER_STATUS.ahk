#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the status of a Distributed Network Name (DNN) resource for a Scale-Out File Server.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_dnn_leader_status
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_DNN_LEADER_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>TRUE</b> if the Distributed Network Name (DNN) resource for the Scale-Out File Server  is online; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    IsOnline {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <b>TRUE</b> if the file server is running; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    IsFileServerPresent {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
