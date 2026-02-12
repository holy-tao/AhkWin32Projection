#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SystemCpuUsageReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ISystemCpuUsage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemCpuUsage
     * @type {Guid}
     */
    static IID => Guid("{6037b3ac-02d6-4234-8362-7fe3adc81f5f}")

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
     * @returns {SystemCpuUsageReport} 
     */
    GetReport() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemCpuUsageReport(value)
    }
}
