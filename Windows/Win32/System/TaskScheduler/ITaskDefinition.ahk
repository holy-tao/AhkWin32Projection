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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RegistrationInfo", "put_RegistrationInfo", "get_Triggers", "put_Triggers", "get_Settings", "put_Settings", "get_Data", "put_Data", "get_Principal", "put_Principal", "get_Actions", "put_Actions", "get_XmlText", "put_XmlText"]

    /**
     * 
     * @param {Pointer<IRegistrationInfo>} ppRegistrationInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_registrationinfo
     */
    get_RegistrationInfo(ppRegistrationInfo) {
        result := ComCall(7, this, "ptr*", ppRegistrationInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRegistrationInfo} pRegistrationInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_registrationinfo
     */
    put_RegistrationInfo(pRegistrationInfo) {
        result := ComCall(8, this, "ptr", pRegistrationInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITriggerCollection>} ppTriggers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_triggers
     */
    get_Triggers(ppTriggers) {
        result := ComCall(9, this, "ptr*", ppTriggers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITriggerCollection} pTriggers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_triggers
     */
    put_Triggers(pTriggers) {
        result := ComCall(10, this, "ptr", pTriggers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITaskSettings>} ppSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_settings
     */
    get_Settings(ppSettings) {
        result := ComCall(11, this, "ptr*", ppSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITaskSettings} pSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_settings
     */
    put_Settings(pSettings) {
        result := ComCall(12, this, "ptr", pSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_data
     */
    get_Data(pData) {
        result := ComCall(13, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_data
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(14, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrincipal>} ppPrincipal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_principal
     */
    get_Principal(ppPrincipal) {
        result := ComCall(15, this, "ptr*", ppPrincipal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrincipal} pPrincipal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_principal
     */
    put_Principal(pPrincipal) {
        result := ComCall(16, this, "ptr", pPrincipal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IActionCollection>} ppActions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_actions
     */
    get_Actions(ppActions) {
        result := ComCall(17, this, "ptr*", ppActions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActionCollection} pActions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_actions
     */
    put_Actions(pActions) {
        result := ComCall(18, this, "ptr", pActions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pXml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_xmltext
     */
    get_XmlText(pXml) {
        result := ComCall(19, this, "ptr", pXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} xml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_xmltext
     */
    put_XmlText(xml) {
        xml := xml is String ? BSTR.Alloc(xml).Value : xml

        result := ComCall(20, this, "ptr", xml, "HRESULT")
        return result
    }
}
