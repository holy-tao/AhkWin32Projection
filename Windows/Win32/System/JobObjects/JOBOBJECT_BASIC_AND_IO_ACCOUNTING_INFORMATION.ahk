#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOBOBJECT_BASIC_ACCOUNTING_INFORMATION.ahk" { JOBOBJECT_BASIC_ACCOUNTING_INFORMATION }
#Import "..\Threading\IO_COUNTERS.ahk" { IO_COUNTERS }

/**
 * Contains basic accounting and I/O accounting information for a job object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_and_io_accounting_information
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION {
    #StructPack 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_accounting_information">JOBOBJECT_BASIC_ACCOUNTING_INFORMATION</a> structure that specifies the basic accounting information for the job.
     */
    BasicInfo : JOBOBJECT_BASIC_ACCOUNTING_INFORMATION

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-io_counters">IO_COUNTERS</a> structure that specifies the I/O accounting information for the job. The structure includes information for all processes that have ever been associated with the job, in addition to the information for all processes currently associated with the job.
     */
    IoInfo : IO_COUNTERS

}
