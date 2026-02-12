#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SystemMemoryUsage.ahk
#Include .\SystemCpuUsage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ISystemDiagnosticInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemDiagnosticInfo
     * @type {Guid}
     */
    static IID => Guid("{a290fe05-dff3-407f-9a1b-0b2b317ca800}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MemoryUsage", "get_CpuUsage"]

    /**
     * @type {SystemMemoryUsage} 
     */
    MemoryUsage {
        get => this.get_MemoryUsage()
    }

    /**
     * @type {SystemCpuUsage} 
     */
    CpuUsage {
        get => this.get_CpuUsage()
    }

    /**
     * 
     * @returns {SystemMemoryUsage} 
     */
    get_MemoryUsage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemMemoryUsage(value)
    }

    /**
     * 
     * @returns {SystemCpuUsage} 
     */
    get_CpuUsage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemCpuUsage(value)
    }
}
