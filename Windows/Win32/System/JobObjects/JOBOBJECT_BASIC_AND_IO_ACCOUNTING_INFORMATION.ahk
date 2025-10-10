#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOBOBJECT_BASIC_ACCOUNTING_INFORMATION.ahk
#Include ..\Threading\IO_COUNTERS.ahk

/**
 * Contains basic accounting and I/O accounting information for a job object.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-jobobject_basic_and_io_accounting_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_accounting_information">JOBOBJECT_BASIC_ACCOUNTING_INFORMATION</a> structure that specifies the basic accounting information for the job.
     * @type {JOBOBJECT_BASIC_ACCOUNTING_INFORMATION}
     */
    BasicInfo{
        get {
            if(!this.HasProp("__BasicInfo"))
                this.__BasicInfo := JOBOBJECT_BASIC_ACCOUNTING_INFORMATION(this.ptr + 0)
            return this.__BasicInfo
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-io_counters">IO_COUNTERS</a> structure that specifies the I/O accounting information for the job. The structure includes information for all processes that have ever been associated with the job, in addition to the information for all processes currently associated with the job.
     * @type {IO_COUNTERS}
     */
    IoInfo{
        get {
            if(!this.HasProp("__IoInfo"))
                this.__IoInfo := IO_COUNTERS(this.ptr + 48)
            return this.__IoInfo
        }
    }
}
