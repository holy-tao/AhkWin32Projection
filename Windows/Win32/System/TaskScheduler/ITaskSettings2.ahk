#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the extended settings that the Task Scheduler uses to run the task.
 * @remarks
 * 
  * When reading or writing XML for a task, the task settings are defined in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-settings-tasktype-element">Settings</a> element of the Task Scheduler schema.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itasksettings2
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskSettings2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskSettings2
     * @type {Guid}
     */
    static IID => Guid("{2c05c3f0-6eed-4c05-a15f-ed7d7a98a369}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisallowStartOnRemoteAppSession", "put_DisallowStartOnRemoteAppSession", "get_UseUnifiedSchedulingEngine", "put_UseUnifiedSchedulingEngine"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pDisallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-get_disallowstartonremoteappsession
     */
    get_DisallowStartOnRemoteAppSession(pDisallowStart) {
        pDisallowStartMarshal := pDisallowStart is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pDisallowStartMarshal, pDisallowStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} disallowStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-put_disallowstartonremoteappsession
     */
    put_DisallowStartOnRemoteAppSession(disallowStart) {
        result := ComCall(8, this, "short", disallowStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pUseUnifiedEngine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-get_useunifiedschedulingengine
     */
    get_UseUnifiedSchedulingEngine(pUseUnifiedEngine) {
        pUseUnifiedEngineMarshal := pUseUnifiedEngine is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, pUseUnifiedEngineMarshal, pUseUnifiedEngine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} useUnifiedEngine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasksettings2-put_useunifiedschedulingengine
     */
    put_UseUnifiedSchedulingEngine(useUnifiedEngine) {
        result := ComCall(10, this, "short", useUnifiedEngine, "HRESULT")
        return result
    }
}
