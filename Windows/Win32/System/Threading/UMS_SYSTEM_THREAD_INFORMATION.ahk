#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a UMS scheduler thread, UMS worker thread, or non-UMS thread. The GetUmsSystemThreadInformation function uses this structure.
 * @remarks
 * If both <b>IsUmsSchedulerThread</b>  and <b>IsUmsWorkerThread</b> are clear, the structure specifies a non-UMS thread.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ums_system_thread_information
 * @namespace Windows.Win32.System.Threading
 */
export default struct UMS_SYSTEM_THREAD_INFORMATION {
    #StructPack 4

    /**
     * The UMS version. This member must be UMS_VERSION.
     */
    UmsVersion : UInt32

    /**
     * This bitfield backs the following members:
     * - IsUmsSchedulerThread
     * - IsUmsWorkerThread
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IsUmsSchedulerThread {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    IsUmsWorkerThread {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'ThreadUmsFlags', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
