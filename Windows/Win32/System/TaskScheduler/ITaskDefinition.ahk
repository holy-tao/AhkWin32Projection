#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrincipal.ahk" { IPrincipal }
#Import ".\IActionCollection.ahk" { IActionCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITriggerCollection.ahk" { ITriggerCollection }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRegistrationInfo.ahk" { IRegistrationInfo }
#Import ".\ITaskSettings.ahk" { ITaskSettings }

/**
 * Defines all the components of a task, such as the task settings, triggers, actions, and registration information.
 * @remarks
 * When reading or writing your own XML for a task, a task definition is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-task-element">Task</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itaskdefinition
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskDefinition extends IDispatch {
    /**
     * The interface identifier for ITaskDefinition
     * @type {Guid}
     */
    static IID := Guid("{f5bc8fc5-536d-4f77-b852-fbc1356fdeb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskDefinition interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RegistrationInfo : IntPtr
        put_RegistrationInfo : IntPtr
        get_Triggers         : IntPtr
        put_Triggers         : IntPtr
        get_Settings         : IntPtr
        put_Settings         : IntPtr
        get_Data             : IntPtr
        put_Data             : IntPtr
        get_Principal        : IntPtr
        put_Principal        : IntPtr
        get_Actions          : IntPtr
        put_Actions          : IntPtr
        get_XmlText          : IntPtr
        put_XmlText          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {BSTR} 
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
     * @type {BSTR} 
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     * Gets or sets the registration information used to describe a task, such as the description of the task, the author of the task, and the date the task is registered. (Get)
     * @returns {IRegistrationInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_registrationinfo
     */
    get_RegistrationInfo() {
        result := ComCall(7, this, "ptr*", &ppRegistrationInfo := 0, "HRESULT")
        return IRegistrationInfo(ppRegistrationInfo)
    }

    /**
     * Gets or sets the registration information used to describe a task, such as the description of the task, the author of the task, and the date the task is registered. (Put)
     * @param {IRegistrationInfo} pRegistrationInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_registrationinfo
     */
    put_RegistrationInfo(pRegistrationInfo) {
        result := ComCall(8, this, "ptr", pRegistrationInfo, "HRESULT")
        return result
    }

    /**
     * Gets or sets a collection of triggers used to start a task. (Get)
     * @returns {ITriggerCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_triggers
     */
    get_Triggers() {
        result := ComCall(9, this, "ptr*", &ppTriggers := 0, "HRESULT")
        return ITriggerCollection(ppTriggers)
    }

    /**
     * Gets or sets a collection of triggers used to start a task. (Put)
     * @param {ITriggerCollection} pTriggers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_triggers
     */
    put_Triggers(pTriggers) {
        result := ComCall(10, this, "ptr", pTriggers, "HRESULT")
        return result
    }

    /**
     * Gets or sets the settings that define how the Task Scheduler service performs the task. (Get)
     * @returns {ITaskSettings} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_settings
     */
    get_Settings() {
        result := ComCall(11, this, "ptr*", &ppSettings := 0, "HRESULT")
        return ITaskSettings(ppSettings)
    }

    /**
     * Gets or sets the settings that define how the Task Scheduler service performs the task. (Put)
     * @param {ITaskSettings} pSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_settings
     */
    put_Settings(pSettings) {
        result := ComCall(12, this, "ptr", pSettings, "HRESULT")
        return result
    }

    /**
     * Gets or sets the data that is associated with the task. (Get)
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_data
     */
    get_Data(pData) {
        result := ComCall(13, this, BSTR.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * Gets or sets the data that is associated with the task. (Put)
     * @param {BSTR} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_data
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(14, this, BSTR, data, "HRESULT")
        return result
    }

    /**
     * Gets or sets the principal for the task that provides the security credentials for the task. (Get)
     * @returns {IPrincipal} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_principal
     */
    get_Principal() {
        result := ComCall(15, this, "ptr*", &ppPrincipal := 0, "HRESULT")
        return IPrincipal(ppPrincipal)
    }

    /**
     * Gets or sets the principal for the task that provides the security credentials for the task. (Put)
     * @param {IPrincipal} pPrincipal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_principal
     */
    put_Principal(pPrincipal) {
        result := ComCall(16, this, "ptr", pPrincipal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a collection of actions performed by the task. (Get)
     * @returns {IActionCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_actions
     */
    get_Actions() {
        result := ComCall(17, this, "ptr*", &ppActions := 0, "HRESULT")
        return IActionCollection(ppActions)
    }

    /**
     * Gets or sets a collection of actions performed by the task. (Put)
     * @param {IActionCollection} pActions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_actions
     */
    put_Actions(pActions) {
        result := ComCall(18, this, "ptr", pActions, "HRESULT")
        return result
    }

    /**
     * Gets or sets the XML-formatted definition of the task. (Get)
     * @remarks
     * The XML for a task is defined by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-schema">Task Scheduler Schema</a>. For an example of task XML, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/daily-trigger-example--xml-">Daily Trigger Example (XML)</a>.
     * @param {Pointer<BSTR>} pXml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-get_xmltext
     */
    get_XmlText(pXml) {
        result := ComCall(19, this, BSTR.Ptr, pXml, "HRESULT")
        return result
    }

    /**
     * Gets or sets the XML-formatted definition of the task. (Put)
     * @remarks
     * The XML for a task is defined by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-scheduler-schema">Task Scheduler Schema</a>. For an example of task XML, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/daily-trigger-example--xml-">Daily Trigger Example (XML)</a>.
     * @param {BSTR} xml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskdefinition-put_xmltext
     */
    put_XmlText(xml) {
        xml := xml is String ? BSTR.Alloc(xml).Value : xml

        result := ComCall(20, this, BSTR, xml, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RegistrationInfo := CallbackCreate(GetMethod(implObj, "get_RegistrationInfo"), flags, 2)
        this.vtbl.put_RegistrationInfo := CallbackCreate(GetMethod(implObj, "put_RegistrationInfo"), flags, 2)
        this.vtbl.get_Triggers := CallbackCreate(GetMethod(implObj, "get_Triggers"), flags, 2)
        this.vtbl.put_Triggers := CallbackCreate(GetMethod(implObj, "put_Triggers"), flags, 2)
        this.vtbl.get_Settings := CallbackCreate(GetMethod(implObj, "get_Settings"), flags, 2)
        this.vtbl.put_Settings := CallbackCreate(GetMethod(implObj, "put_Settings"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
        this.vtbl.get_Principal := CallbackCreate(GetMethod(implObj, "get_Principal"), flags, 2)
        this.vtbl.put_Principal := CallbackCreate(GetMethod(implObj, "put_Principal"), flags, 2)
        this.vtbl.get_Actions := CallbackCreate(GetMethod(implObj, "get_Actions"), flags, 2)
        this.vtbl.put_Actions := CallbackCreate(GetMethod(implObj, "put_Actions"), flags, 2)
        this.vtbl.get_XmlText := CallbackCreate(GetMethod(implObj, "get_XmlText"), flags, 2)
        this.vtbl.put_XmlText := CallbackCreate(GetMethod(implObj, "put_XmlText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RegistrationInfo)
        CallbackFree(this.vtbl.put_RegistrationInfo)
        CallbackFree(this.vtbl.get_Triggers)
        CallbackFree(this.vtbl.put_Triggers)
        CallbackFree(this.vtbl.get_Settings)
        CallbackFree(this.vtbl.put_Settings)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
        CallbackFree(this.vtbl.get_Principal)
        CallbackFree(this.vtbl.put_Principal)
        CallbackFree(this.vtbl.get_Actions)
        CallbackFree(this.vtbl.put_Actions)
        CallbackFree(this.vtbl.get_XmlText)
        CallbackFree(this.vtbl.put_XmlText)
    }
}
