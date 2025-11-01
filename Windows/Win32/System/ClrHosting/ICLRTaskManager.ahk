#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<ICLRTask>} pTask 
     * @returns {HRESULT} 
     */
    CreateTask(pTask) {
        result := ComCall(3, this, "ptr*", pTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICLRTask>} pTask 
     * @returns {HRESULT} 
     */
    GetCurrentTask(pTask) {
        result := ComCall(4, this, "ptr*", pTask, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pTaskType 
     * @returns {HRESULT} 
     */
    GetCurrentTaskType(pTaskType) {
        pTaskTypeMarshal := pTaskType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pTaskTypeMarshal, pTaskType, "HRESULT")
        return result
    }
}
