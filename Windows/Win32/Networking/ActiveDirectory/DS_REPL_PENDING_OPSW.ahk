#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DS_REPL_OPW.ahk

/**
 * Contains an array of DS_REPL_OP structures, which in turn describe the replication tasks currently executing and queued to execute, as returned by the DsReplicaGetInfo and DsReplicaGetInfo2 functions.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_pending_opsw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_PENDING_OPSW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time at which the first operation in the queue began executing.
     * @type {FILETIME}
     */
    ftimeCurrentOpStarted{
        get {
            if(!this.HasProp("__ftimeCurrentOpStarted"))
                this.__ftimeCurrentOpStarted := FILETIME(this.ptr + 0)
            return this.__ftimeCurrentOpStarted
        }
    }

    /**
     * Contains the number of elements in the <b>rgPendingOps</b> array.
     * @type {Integer}
     */
    cNumPendingOps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repl_opw">DS_REPL_OP</a> structures that contain the replication tasks currently executing and queued to execute.
     * @type {Array<DS_REPL_OPW>}
     */
    rgPendingOp{
        get {
            if(!this.HasProp("__rgPendingOpProxyArray"))
                this.__rgPendingOpProxyArray := Win32FixedArray(this.ptr + 16, 1, DS_REPL_OPW, "")
            return this.__rgPendingOpProxyArray
        }
    }
}
