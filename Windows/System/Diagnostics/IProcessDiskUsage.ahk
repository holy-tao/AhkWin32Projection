#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ProcessDiskUsageReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessDiskUsage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDiskUsage
     * @type {Guid}
     */
    static IID => Guid("{5ad78bfd-7e51-4e53-bfaa-5a6ee1aabbf8}")

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
     * @returns {ProcessDiskUsageReport} 
     */
    GetReport() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessDiskUsageReport(value)
    }
}
