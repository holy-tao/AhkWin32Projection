#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ProcessMemoryUsageReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessMemoryUsage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessMemoryUsage
     * @type {Guid}
     */
    static IID => Guid("{f50b229b-827c-42b7-b07c-0e32627e6b3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReport"]

    /**
     * 
     * @returns {ProcessMemoryUsageReport} 
     */
    GetReport() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessMemoryUsageReport(value)
    }
}
