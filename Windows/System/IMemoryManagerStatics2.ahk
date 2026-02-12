#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppMemoryReport.ahk
#Include .\ProcessMemoryReport.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IMemoryManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemoryManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{6eee351f-6d62-423f-9479-b01f9c9f7669}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppMemoryReport", "GetProcessMemoryReport"]

    /**
     * 
     * @returns {AppMemoryReport} 
     */
    GetAppMemoryReport() {
        result := ComCall(6, this, "ptr*", &memoryReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppMemoryReport(memoryReport)
    }

    /**
     * 
     * @returns {ProcessMemoryReport} 
     */
    GetProcessMemoryReport() {
        result := ComCall(7, this, "ptr*", &memoryReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessMemoryReport(memoryReport)
    }
}
