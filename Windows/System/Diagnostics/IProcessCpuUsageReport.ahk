#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessCpuUsageReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessCpuUsageReport
     * @type {Guid}
     */
    static IID => Guid("{8a6d9cac-3987-4e2f-a119-6b5fa214f1b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KernelTime", "get_UserTime"]

    /**
     * @type {TimeSpan} 
     */
    KernelTime {
        get => this.get_KernelTime()
    }

    /**
     * @type {TimeSpan} 
     */
    UserTime {
        get => this.get_UserTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_KernelTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UserTime() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
