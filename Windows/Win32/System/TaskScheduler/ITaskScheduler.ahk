#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for scheduling tasks.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-itaskscheduler
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskScheduler extends IUnknown{
    /**
     * The interface identifier for ITaskScheduler
     * @type {Guid}
     */
    static IID => Guid("{148bd527-a2ab-11ce-b11f-00aa00530503}")

    /**
     * The class identifier for TaskScheduler
     * @type {Guid}
     */
    static CLSID => Guid("{0f87369f-a4e5-4cfc-bd3e-73e6154572dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszComputer 
     * @returns {HRESULT} 
     */
    SetTargetComputer(pwszComputer) {
        pwszComputer := pwszComputer is String ? StrPtr(pwszComputer) : pwszComputer

        result := ComCall(3, this, "ptr", pwszComputer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszComputer 
     * @returns {HRESULT} 
     */
    GetTargetComputer(ppwszComputer) {
        result := ComCall(4, this, "ptr", ppwszComputer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWorkItems>} ppEnumWorkItems 
     * @returns {HRESULT} 
     */
    Enum(ppEnumWorkItems) {
        result := ComCall(5, this, "ptr", ppEnumWorkItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    Activate(pwszName, riid, ppUnk) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    Delete(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszTaskName 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    NewWorkItem(pwszTaskName, rclsid, riid, ppUnk) {
        pwszTaskName := pwszTaskName is String ? StrPtr(pwszTaskName) : pwszTaskName

        result := ComCall(8, this, "ptr", pwszTaskName, "ptr", rclsid, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszTaskName 
     * @param {Pointer<IScheduledWorkItem>} pWorkItem 
     * @returns {HRESULT} 
     */
    AddWorkItem(pwszTaskName, pWorkItem) {
        pwszTaskName := pwszTaskName is String ? StrPtr(pwszTaskName) : pwszTaskName

        result := ComCall(9, this, "ptr", pwszTaskName, "ptr", pWorkItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    IsOfType(pwszName, riid) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "ptr", pwszName, "ptr", riid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
