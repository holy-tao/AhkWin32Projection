#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRTaskManager extends IUnknown{
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
     * 
     * @param {Pointer<ICLRTask>} pTask 
     * @returns {HRESULT} 
     */
    CreateTask(pTask) {
        result := ComCall(3, this, "ptr", pTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICLRTask>} pTask 
     * @returns {HRESULT} 
     */
    GetCurrentTask(pTask) {
        result := ComCall(4, this, "ptr", pTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetUILocale(lcid) {
        result := ComCall(5, this, "uint", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetLocale(lcid) {
        result := ComCall(6, this, "uint", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTaskType 
     * @returns {HRESULT} 
     */
    GetCurrentTaskType(pTaskType) {
        result := ComCall(7, this, "int*", pTaskType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
