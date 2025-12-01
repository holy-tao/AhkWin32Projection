#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents summary information about a process hosting COM+ applications.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationprocesssummary
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ApplicationProcessSummary extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The partition ID of the COM+ server application, for server application processes. For processes that are not hosting a COM+ server application, this is set to the partition ID of the first tracked component instantiated in the process.
     * @type {Pointer<Guid>}
     */
    PartitionIdPrimaryApplication {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The application ID of the COM+ server application, for server application processes. For processes that are not hosting a COM+ server application, this is set to the application ID of the first tracked component instantiated in the process.
     * @type {Pointer<Guid>}
     */
    ApplicationIdPrimaryApplication {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The application instance GUID uniquely identifying the tracked process.
     * @type {Pointer<Guid>}
     */
    ApplicationInstanceId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The process ID of the tracked process.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The type of application this process is hosting. For COM+ server application processes, this is set to APPTYPE_SERVER. For processes that are not hosting a COM+ server applications, this is set to either APPTYPE_LIBRARY or APPTYPE_SWC, based on the first tracked component instantiated in the process.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The name of the process's executable image. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_PROCESS_EXE_NAME flag when you call a method that returns an <b>ApplicationProcessSummary</b> structure.
     * @type {PWSTR}
     */
    ProcessExeName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Indicates whether the process is a COM+ server application running as a Windows service.
     * @type {BOOL}
     */
    IsService {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Indicates whether the process is a COM+ server application instance that is paused.
     * @type {BOOL}
     */
    IsPaused {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Indicates whether the process is a COM+ server application instance that has been recycled.
     * @type {BOOL}
     */
    IsRecycled {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
