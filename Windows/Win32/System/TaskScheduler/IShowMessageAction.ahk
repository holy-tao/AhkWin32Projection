#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAction.ahk" { IAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents an action that shows a message box when a task is activated.
 * @remarks
 * For a task, that contains a message box action, the message box will be displayed if the task is activated and the task has an interactive logon type.  To set the task logon type to be interactive, specify <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or  <b>TASK_LOGON_GROUP</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property of the task principal, or in the <i>logonType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a>. 
 * 
 * When reading or writing your own XML for a task, a message box action is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-showmessage-actiongroup-element">ShowMessage</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-ishowmessageaction
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IShowMessageAction extends IAction {
    /**
     * The interface identifier for IShowMessageAction
     * @type {Guid}
     */
    static IID := Guid("{505e9e68-af89-46b8-a30f-56162a83d537}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShowMessageAction interfaces
    */
    struct Vtbl extends IAction.Vtbl {
        get_Title       : IntPtr
        put_Title       : IntPtr
        get_MessageBody : IntPtr
        put_MessageBody : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShowMessageAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {BSTR} 
     */
    MessageBody {
        get => this.get_MessageBody()
        set => this.put_MessageBody(value)
    }

    /**
     * Gets or sets the title of the message box. (Get)
     * @remarks
     * Parameterized strings  can be used in the title text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ishowmessageaction-get_title
     */
    get_Title(pTitle) {
        result := ComCall(10, this, BSTR.Ptr, pTitle, "HRESULT")
        return result
    }

    /**
     * Gets or sets the title of the message box. (Put)
     * @remarks
     * Parameterized strings  can be used in the title text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} title 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ishowmessageaction-put_title
     */
    put_Title(title) {
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(11, this, BSTR, title, "HRESULT")
        return result
    }

    /**
     * Gets or sets the message text that is displayed in the body of the message box. (Get)
     * @remarks
     * Parameterized strings  can be used in the message text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pMessageBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ishowmessageaction-get_messagebody
     */
    get_MessageBody(pMessageBody) {
        result := ComCall(12, this, BSTR.Ptr, pMessageBody, "HRESULT")
        return result
    }

    /**
     * Gets or sets the message text that is displayed in the body of the message box. (Put)
     * @remarks
     * Parameterized strings  can be used in the message text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} messageBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ishowmessageaction-put_messagebody
     */
    put_MessageBody(messageBody) {
        messageBody := messageBody is String ? BSTR.Alloc(messageBody).Value : messageBody

        result := ComCall(13, this, BSTR, messageBody, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShowMessageAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.put_Title := CallbackCreate(GetMethod(implObj, "put_Title"), flags, 2)
        this.vtbl.get_MessageBody := CallbackCreate(GetMethod(implObj, "get_MessageBody"), flags, 2)
        this.vtbl.put_MessageBody := CallbackCreate(GetMethod(implObj, "put_MessageBody"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.put_Title)
        CallbackFree(this.vtbl.get_MessageBody)
        CallbackFree(this.vtbl.put_MessageBody)
    }
}
