#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Defines all the components of a task, such as the task settings, triggers, actions, and registration information.
 * @remarks
 * 
  * When reading or writing your own XML for a task, a task definition is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-task-element">Task</a> element of the Task Scheduler schema.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskdefinition
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskDefinition extends IDispatch{
    /**
     * The interface identifier for ITaskDefinition
     * @type {Guid}
     */
    static IID => Guid("{f5bc8fc5-536d-4f77-b852-fbc1356fdeb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IRegistrationInfo>} ppRegistrationInfo 
     * @returns {HRESULT} 
     */
    get_RegistrationInfo(ppRegistrationInfo) {
        result := ComCall(7, this, "ptr", ppRegistrationInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRegistrationInfo>} pRegistrationInfo 
     * @returns {HRESULT} 
     */
    put_RegistrationInfo(pRegistrationInfo) {
        result := ComCall(8, this, "ptr", pRegistrationInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITriggerCollection>} ppTriggers 
     * @returns {HRESULT} 
     */
    get_Triggers(ppTriggers) {
        result := ComCall(9, this, "ptr", ppTriggers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITriggerCollection>} pTriggers 
     * @returns {HRESULT} 
     */
    put_Triggers(pTriggers) {
        result := ComCall(10, this, "ptr", pTriggers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITaskSettings>} ppSettings 
     * @returns {HRESULT} 
     */
    get_Settings(ppSettings) {
        result := ComCall(11, this, "ptr", ppSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITaskSettings>} pSettings 
     * @returns {HRESULT} 
     */
    put_Settings(pSettings) {
        result := ComCall(12, this, "ptr", pSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     */
    get_Data(pData) {
        result := ComCall(13, this, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(14, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrincipal>} ppPrincipal 
     * @returns {HRESULT} 
     */
    get_Principal(ppPrincipal) {
        result := ComCall(15, this, "ptr", ppPrincipal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrincipal>} pPrincipal 
     * @returns {HRESULT} 
     */
    put_Principal(pPrincipal) {
        result := ComCall(16, this, "ptr", pPrincipal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IActionCollection>} ppActions 
     * @returns {HRESULT} 
     */
    get_Actions(ppActions) {
        result := ComCall(17, this, "ptr", ppActions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IActionCollection>} pActions 
     * @returns {HRESULT} 
     */
    put_Actions(pActions) {
        result := ComCall(18, this, "ptr", pActions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pXml 
     * @returns {HRESULT} 
     */
    get_XmlText(pXml) {
        result := ComCall(19, this, "ptr", pXml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} xml 
     * @returns {HRESULT} 
     */
    put_XmlText(xml) {
        xml := xml is String ? BSTR.Alloc(xml).Value : xml

        result := ComCall(20, this, "ptr", xml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
