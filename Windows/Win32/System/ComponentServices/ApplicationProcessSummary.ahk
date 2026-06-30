#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COMPLUS_APPTYPE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Represents summary information about a process hosting COM+ applications.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationprocesssummary
 * @namespace Windows.Win32.System.ComponentServices
 */
class ApplicationProcessSummary extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * The partition ID of the COM+ server application, for server application processes. For processes that are not hosting a COM+ server application, this is set to the partition ID of the first tracked component instantiated in the process.
     * @type {Guid}
     */
    PartitionIdPrimaryApplication {
        get {
            if(!this.HasProp("__PartitionIdPrimaryApplication"))
                this.__PartitionIdPrimaryApplication := Guid(0, this)
            return this.__PartitionIdPrimaryApplication
        }
    }

    /**
     * The application ID of the COM+ server application, for server application processes. For processes that are not hosting a COM+ server application, this is set to the application ID of the first tracked component instantiated in the process.
     * @type {Guid}
     */
    ApplicationIdPrimaryApplication {
        get {
            if(!this.HasProp("__ApplicationIdPrimaryApplication"))
                this.__ApplicationIdPrimaryApplication := Guid(16, this)
            return this.__ApplicationIdPrimaryApplication
        }
    }

    /**
     * The application instance GUID uniquely identifying the tracked process.
     * @type {Guid}
     */
    ApplicationInstanceId {
        get {
            if(!this.HasProp("__ApplicationInstanceId"))
                this.__ApplicationInstanceId := Guid(32, this)
            return this.__ApplicationInstanceId
        }
    }

    /**
     * The process ID of the tracked process.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The type of application this process is hosting. For COM+ server application processes, this is set to APPTYPE_SERVER. For processes that are not hosting a COM+ server applications, this is set to either APPTYPE_LIBRARY or APPTYPE_SWC, based on the first tracked component instantiated in the process.
     * @type {COMPLUS_APPTYPE}
     */
    Type {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * The name of the process's executable image. Space for this string is allocated by the method called and freed by the caller (for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>). This member is not returned by default. To return this member, specify the GATD_INCLUDE_PROCESS_EXE_NAME flag when you call a method that returns an <b>ApplicationProcessSummary</b> structure.
     * @type {PWSTR}
     */
    ProcessExeName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Indicates whether the process is a COM+ server application running as a Windows service.
     * @type {BOOL}
     */
    IsService {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Indicates whether the process is a COM+ server application instance that is paused.
     * @type {BOOL}
     */
    IsPaused {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * Indicates whether the process is a COM+ server application instance that has been recycled.
     * @type {BOOL}
     */
    IsRecycled {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
