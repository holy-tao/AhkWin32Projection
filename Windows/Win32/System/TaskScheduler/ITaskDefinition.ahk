#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRegistrationInfo.ahk
#Include .\ITriggerCollection.ahk
#Include .\ITaskSettings.ahk
#Include .\IPrincipal.ahk
#Include .\IActionCollection.ahk
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
     * @type {IRegistrationInfo} 
     */
    RegistrationInfo {
        get => this.get_RegistrationInfo()
        set => this.put_RegistrationInfo(value)
    }

    /**
     * @type {ITriggerCollection} 
     */
    Triggers {
        get => this.get_Triggers()
        set => this.put_Triggers(value)
    }

    /**
     * @type {ITaskSettings} 
     */
    Settings {
        get => this.get_Settings()
        set => this.put_Settings(value)
    }

    /**
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * @type {IPrincipal} 
     */
    Principal {
        get => this.get_Principal()
        set => this.put_Principal(value)
    }

    /**
     * @type {IActionCollection} 
     */
    Actions {
        get => this.get_Actions()
        set => this.put_Actions(value)
    }

    /**
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     * Gets or sets the registration information used to describe a task, such as the description of the task, the author of the task, and the date the task is registered.
     * @returns {IRegistrationInfo} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_registrationinfo
     */
    get_RegistrationInfo() {
        result := ComCall(7, this, "ptr*", &ppRegistrationInfo := 0, "HRESULT")
        return IRegistrationInfo(ppRegistrationInfo)
    }

    /**
     * Gets or sets the registration information used to describe a task, such as the description of the task, the author of the task, and the date the task is registered.
     * @param {IRegistrationInfo} pRegistrationInfo 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_registrationinfo
     */
    put_RegistrationInfo(pRegistrationInfo) {
        result := ComCall(8, this, "ptr", pRegistrationInfo, "HRESULT")
        return result
    }

    /**
     * Gets or sets a collection of triggers used to start a task.
     * @returns {ITriggerCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_triggers
     */
    get_Triggers() {
        result := ComCall(9, this, "ptr*", &ppTriggers := 0, "HRESULT")
        return ITriggerCollection(ppTriggers)
    }

    /**
     * Gets or sets a collection of triggers used to start a task.
     * @param {ITriggerCollection} pTriggers 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_triggers
     */
    put_Triggers(pTriggers) {
        result := ComCall(10, this, "ptr", pTriggers, "HRESULT")
        return result
    }

    /**
     * Gets or sets the settings that define how the Task Scheduler service performs the task.
     * @returns {ITaskSettings} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_settings
     */
    get_Settings() {
        result := ComCall(11, this, "ptr*", &ppSettings := 0, "HRESULT")
        return ITaskSettings(ppSettings)
    }

    /**
     * Gets or sets the settings that define how the Task Scheduler service performs the task.
     * @param {ITaskSettings} pSettings 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_settings
     */
    put_Settings(pSettings) {
        result := ComCall(12, this, "ptr", pSettings, "HRESULT")
        return result
    }

    /**
     * Gets or sets the data that is associated with the task.
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_data
     */
    get_Data(pData) {
        result := ComCall(13, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets or sets the data that is associated with the task.
     * @param {BSTR} data 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_data
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(14, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Gets or sets the principal for the task that provides the security credentials for the task.
     * @returns {IPrincipal} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_principal
     */
    get_Principal() {
        result := ComCall(15, this, "ptr*", &ppPrincipal := 0, "HRESULT")
        return IPrincipal(ppPrincipal)
    }

    /**
     * Gets or sets the principal for the task that provides the security credentials for the task.
     * @param {IPrincipal} pPrincipal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_principal
     */
    put_Principal(pPrincipal) {
        result := ComCall(16, this, "ptr", pPrincipal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a collection of actions performed by the task.
     * @returns {IActionCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_actions
     */
    get_Actions() {
        result := ComCall(17, this, "ptr*", &ppActions := 0, "HRESULT")
        return IActionCollection(ppActions)
    }

    /**
     * Gets or sets a collection of actions performed by the task.
     * @param {IActionCollection} pActions 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_actions
     */
    put_Actions(pActions) {
        result := ComCall(18, this, "ptr", pActions, "HRESULT")
        return result
    }

    /**
     * Gets or sets the XML-formatted definition of the task.
     * @remarks
     * 
     * The XML for a task is defined by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-schema">Task Scheduler Schema</a>. For an example of task XML, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/daily-trigger-example--xml-">Daily Trigger Example (XML)</a>.
     * 
     * 
     * @param {Pointer<BSTR>} pXml 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-get_xmltext
     */
    get_XmlText(pXml) {
        result := ComCall(19, this, "ptr", pXml, "HRESULT")
        return result
    }

    /**
     * Gets or sets the XML-formatted definition of the task.
     * @remarks
     * 
     * The XML for a task is defined by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-schema">Task Scheduler Schema</a>. For an example of task XML, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/daily-trigger-example--xml-">Daily Trigger Example (XML)</a>.
     * 
     * 
     * @param {BSTR} xml 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskdefinition-put_xmltext
     */
    put_XmlText(xml) {
        xml := xml is String ? BSTR.Alloc(xml).Value : xml

        result := ComCall(20, this, "ptr", xml, "HRESULT")
        return result
    }
}
