#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProcessDiagnosticInfo.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\ProcessDiskUsage.ahk
#Include .\ProcessMemoryUsage.ahk
#Include .\ProcessCpuUsage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessDiagnosticInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDiagnosticInfo
     * @type {Guid}
     */
    static IID => Guid("{e830b04b-300e-4ee6-a0ab-5b5f5231b434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProcessId", "get_ExecutableFileName", "get_Parent", "get_ProcessStartTime", "get_DiskUsage", "get_MemoryUsage", "get_CpuUsage"]

    /**
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * @type {HSTRING} 
     */
    ExecutableFileName {
        get => this.get_ExecutableFileName()
    }

    /**
     * @type {ProcessDiagnosticInfo} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {DateTime} 
     */
    ProcessStartTime {
        get => this.get_ProcessStartTime()
    }

    /**
     * @type {ProcessDiskUsage} 
     */
    DiskUsage {
        get => this.get_DiskUsage()
    }

    /**
     * @type {ProcessMemoryUsage} 
     */
    MemoryUsage {
        get => this.get_MemoryUsage()
    }

    /**
     * @type {ProcessCpuUsage} 
     */
    CpuUsage {
        get => this.get_CpuUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExecutableFileName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ProcessDiagnosticInfo} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessDiagnosticInfo(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ProcessStartTime() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ProcessDiskUsage} 
     */
    get_DiskUsage() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessDiskUsage(value)
    }

    /**
     * 
     * @returns {ProcessMemoryUsage} 
     */
    get_MemoryUsage() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessMemoryUsage(value)
    }

    /**
     * 
     * @returns {ProcessCpuUsage} 
     */
    get_CpuUsage() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessCpuUsage(value)
    }
}
