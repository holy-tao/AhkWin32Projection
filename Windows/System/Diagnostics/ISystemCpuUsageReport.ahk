#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ISystemCpuUsageReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemCpuUsageReport
     * @type {Guid}
     */
    static IID => Guid("{2c26d0b2-9483-4f62-ab57-82b29d9719b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KernelTime", "get_UserTime", "get_IdleTime"]

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
     * @type {TimeSpan} 
     */
    IdleTime {
        get => this.get_IdleTime()
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

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_IdleTime() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
