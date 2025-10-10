#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Used to contain replication queue statistics.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms676274(v=vs.85)">DS_REPL_QUEUE_STATISTICSW_BLOB</a> is an alias for this structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_repl_queue_statisticsw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_QUEUE_STATISTICSW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time that the currently running operation started.
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
     * Contains the number of currently pending operations.
     * @type {Integer}
     */
    cNumPendingOps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest synchronization operation.
     * @type {FILETIME}
     */
    ftimeOldestSync{
        get {
            if(!this.HasProp("__ftimeOldestSync"))
                this.__ftimeOldestSync := FILETIME(this.ptr + 16)
            return this.__ftimeOldestSync
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest add operation.
     * @type {FILETIME}
     */
    ftimeOldestAdd{
        get {
            if(!this.HasProp("__ftimeOldestAdd"))
                this.__ftimeOldestAdd := FILETIME(this.ptr + 24)
            return this.__ftimeOldestAdd
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest modification operation.
     * @type {FILETIME}
     */
    ftimeOldestMod{
        get {
            if(!this.HasProp("__ftimeOldestMod"))
                this.__ftimeOldestMod := FILETIME(this.ptr + 32)
            return this.__ftimeOldestMod
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest delete operation.
     * @type {FILETIME}
     */
    ftimeOldestDel{
        get {
            if(!this.HasProp("__ftimeOldestDel"))
                this.__ftimeOldestDel := FILETIME(this.ptr + 40)
            return this.__ftimeOldestDel
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date and time of the oldest reference update operation.
     * @type {FILETIME}
     */
    ftimeOldestUpdRefs{
        get {
            if(!this.HasProp("__ftimeOldestUpdRefs"))
                this.__ftimeOldestUpdRefs := FILETIME(this.ptr + 48)
            return this.__ftimeOldestUpdRefs
        }
    }
}
