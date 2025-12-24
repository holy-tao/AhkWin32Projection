#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAction.ahk

/**
 * Represents an action that shows a message box when a task is activated.
 * @remarks
 * 
 * For a task, that contains a message box action, the message box will be displayed if the task is activated and the task has an interactive logon type.  To set the task logon type to be interactive, specify <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or  <b>TASK_LOGON_GROUP</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property of the task principal, or in the <i>logonType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a>. 
 * 
 * When reading or writing your own XML for a task, a message box action is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-showmessage-actiongroup-element">ShowMessage</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-ishowmessageaction
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IShowMessageAction extends IAction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShowMessageAction
     * @type {Guid}
     */
    static IID => Guid("{505e9e68-af89-46b8-a30f-56162a83d537}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "put_Title", "get_MessageBody", "put_MessageBody"]

    /**
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     */
    MessageBody {
        get => this.get_MessageBody()
        set => this.put_MessageBody(value)
    }

    /**
     * Gets or sets the title of the message box.
     * @remarks
     * 
     * Parameterized strings  can be used in the title text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pTitle 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ishowmessageaction-get_title
     */
    get_Title(pTitle) {
        result := ComCall(10, this, "ptr", pTitle, "HRESULT")
        return result
    }

    /**
     * Gets or sets the title of the message box.
     * @remarks
     * 
     * Parameterized strings  can be used in the title text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} title 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ishowmessageaction-put_title
     */
    put_Title(title) {
        title := title is String ? BSTR.Alloc(title).Value : title

        result := ComCall(11, this, "ptr", title, "HRESULT")
        return result
    }

    /**
     * Gets or sets the message text that is displayed in the body of the message box.
     * @remarks
     * 
     * Parameterized strings  can be used in the message text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pMessageBody 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ishowmessageaction-get_messagebody
     */
    get_MessageBody(pMessageBody) {
        result := ComCall(12, this, "ptr", pMessageBody, "HRESULT")
        return result
    }

    /**
     * Gets or sets the message text that is displayed in the body of the message box.
     * @remarks
     * 
     * Parameterized strings  can be used in the message text of the message box.  For more information, see the Examples section in <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries">ValueQueries</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} messageBody 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ishowmessageaction-put_messagebody
     */
    put_MessageBody(messageBody) {
        messageBody := messageBody is String ? BSTR.Alloc(messageBody).Value : messageBody

        result := ComCall(13, this, "ptr", messageBody, "HRESULT")
        return result
    }
}
