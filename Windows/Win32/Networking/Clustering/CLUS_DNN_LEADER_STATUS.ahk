#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
    IsOnline{
        get {
            if(!this.HasProp("__IsOnline"))
                this.__IsOnline := BOOL(this.ptr + 0)
            return this.__IsOnline
        }
    }

    /**
     * <b>TRUE</b> if the file server is running; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    IsFileServerPresent{
        get {
            if(!this.HasProp("__IsFileServerPresent"))
                this.__IsFileServerPresent := BOOL(this.ptr + 4)
            return this.__IsFileServerPresent
        }
    }
}
