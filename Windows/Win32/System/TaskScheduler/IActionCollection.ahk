#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAction.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the actions that are performed by the task.
 * @remarks
 * 
 * When reading or writing XML for a task, the actions of the task are specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-actions-tasktype-element">Actions</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iactioncollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IActionCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionCollection
     * @type {Guid}
     */
    static IID => Guid("{02820e19-7b98-4ed2-b2e8-fdccceff619b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "get_XmlText", "put_XmlText", "Create", "Remove", "Clear", "get_Context", "put_Context"]

    /**
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     */
    Context {
        get => this.get_Context()
        set => this.put_Context(value)
    }

    /**
     * Gets the number of actions in the collection.
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Gets a specified action from the collection.
     * @remarks
     * 
     * Collections are 1-based. In other words, the index for the first item in the collection is 1.
     * 
     * 
     * @param {Integer} index 
     * @returns {IAction} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &ppAction := 0, "HRESULT")
        return IAction(ppAction)
    }

    /**
     * Gets the collection enumerator for the action collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * Gets or sets an XML-formatted version of the collection.
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(10, this, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted version of the collection.
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(11, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * Creates and adds a new action to the collection.
     * @param {Integer} type This parameter is set to one of the following  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_action_type">TASK_ACTION_TYPE</a> enumeration constants.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_ACTION_EXEC"></a><a id="task_action_exec"></a><dl>
     * <dt><b>TASK_ACTION_EXEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action performs a command-line operation. For example, the action could run a script, start an executable, or, if the name of a document is provided, find its associated application and start the application with the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_ACTION_COM_HANDLER"></a><a id="task_action_com_handler"></a><dl>
     * <dt><b>TASK_ACTION_COM_HANDLER</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action fires a handler.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_ACTION_SEND_EMAIL"></a><a id="task_action_send_email"></a><dl>
     * <dt><b>TASK_ACTION_SEND_EMAIL</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This action sends an email message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_ACTION_SHOW_MESSAGE"></a><a id="task_action_show_message"></a><dl>
     * <dt><b>TASK_ACTION_SHOW_MESSAGE</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This action shows a message box.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IAction} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iaction">IAction</a> interface that represents the new action. 
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iaction">IAction</a> interface pointer.  Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-create
     */
    Create(type) {
        result := ComCall(12, this, "int", type, "ptr*", &ppAction := 0, "HRESULT")
        return IAction(ppAction)
    }

    /**
     * Removes the specified action from the collection.
     * @param {VARIANT} index The index of the action to be removed. Use a LONG value for the index number.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-remove
     */
    Remove(index) {
        result := ComCall(13, this, "ptr", index, "HRESULT")
        return result
    }

    /**
     * Clears all the actions from the collection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-clear
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the principal for the task.
     * @param {Pointer<BSTR>} pContext 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-get_context
     */
    get_Context(pContext) {
        result := ComCall(15, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the principal for the task.
     * @param {BSTR} context 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iactioncollection-put_context
     */
    put_Context(context) {
        context := context is String ? BSTR.Alloc(context).Value : context

        result := ComCall(16, this, "ptr", context, "HRESULT")
        return result
    }
}
