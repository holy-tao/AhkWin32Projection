#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\COMPLUS_APPTYPE.ahk" { COMPLUS_APPTYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents summary information about a process hosting COM+ applications.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationprocesssummary
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ApplicationProcessSummary {
    #StructPack 8

    /**
     * The partition ID of the COM+ server application, for server application processes. For processes that are not hosting a COM+ server application, this is set to the partition ID of the first tracked component instantiated in the process.
     */
    PartitionIdPrimaryApplication : Guid

    /**
     * The application ID of the COM+ server application, for server application processes. For processes that are not hosting a COM+ server application, this is set to the application ID of the first tracked component instantiated in the process.
     */
    ApplicationIdPrimaryApplication : Guid

    /**
     * The application instance GUID uniquely identifying the tracked process.
     */
    ApplicationInstanceId : Guid

    /**
     * The process ID of the tracked process.
     */
    ProcessId : UInt32

    /**
     * The type of application this process is hosting. For COM+ server application processes, this is set to APPTYPE_SERVER. For processes that are not hosting a COM+ server applications, this is set to either APPTYPE_LIBRARY or APPTYPE_SWC, based on the first tracked component instantiated in the process.
     */
    Type : COMPLUS_APPTYPE

    /**
     * The name of the process's executable image. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_PROCESS_EXE_NAME flag when you call a method that returns an <b>ApplicationProcessSummary</b> structure.
     */
    ProcessExeName : PWSTR

    /**
     * Indicates whether the process is a COM+ server application running as a Windows service.
     */
    IsService : BOOL

    /**
     * Indicates whether the process is a COM+ server application instance that is paused.
     */
    IsPaused : BOOL

    /**
     * Indicates whether the process is a COM+ server application instance that has been recycled.
     */
    IsRecycled : BOOL

}
