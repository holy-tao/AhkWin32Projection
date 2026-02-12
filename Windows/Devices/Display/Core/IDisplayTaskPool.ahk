#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayTask.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayTaskPool extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayTaskPool
     * @type {Guid}
     */
    static IID => Guid("{c676253d-237d-5548-aafa-3e517fefef1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTask", "ExecuteTask"]

    /**
     * 
     * @returns {DisplayTask} 
     */
    CreateTask() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayTask(result_)
    }

    /**
     * 
     * @param {DisplayTask} task 
     * @returns {HRESULT} 
     */
    ExecuteTask(task) {
        result := ComCall(7, this, "ptr", task, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
