#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IProcessMemoryReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessMemoryReport
     * @type {Guid}
     */
    static IID => Guid("{087305a8-9b70-4782-8741-3a982b6ce5e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrivateWorkingSetUsage", "get_TotalWorkingSetUsage"]

    /**
     * @type {Integer} 
     */
    PrivateWorkingSetUsage {
        get => this.get_PrivateWorkingSetUsage()
    }

    /**
     * @type {Integer} 
     */
    TotalWorkingSetUsage {
        get => this.get_TotalWorkingSetUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivateWorkingSetUsage() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalWorkingSetUsage() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
