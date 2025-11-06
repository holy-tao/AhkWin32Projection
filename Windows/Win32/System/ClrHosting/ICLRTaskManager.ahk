#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICLRTask.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRTaskManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRTaskManager
     * @type {Guid}
     */
    static IID => Guid("{4862efbe-3ae5-44f8-8feb-346190ee8a34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTask", "GetCurrentTask", "SetUILocale", "SetLocale", "GetCurrentTaskType"]

    /**
     * 
     * @returns {ICLRTask} 
     */
    CreateTask() {
        result := ComCall(3, this, "ptr*", &pTask := 0, "HRESULT")
        return ICLRTask(pTask)
    }

    /**
     * 
     * @returns {ICLRTask} 
     */
    GetCurrentTask() {
        result := ComCall(4, this, "ptr*", &pTask := 0, "HRESULT")
        return ICLRTask(pTask)
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetUILocale(lcid) {
        result := ComCall(5, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentTaskType() {
        result := ComCall(7, this, "int*", &pTaskType := 0, "HRESULT")
        return pTaskType
    }
}
