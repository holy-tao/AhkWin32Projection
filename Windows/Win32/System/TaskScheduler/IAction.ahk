#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\TASK_ACTION_TYPE.ahk" { TASK_ACTION_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides the common properties inherited by all action objects.
 * @remarks
 * For more information about how actions and tasks work together, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-actions">Task Actions</a>. The following table contains the interfaces that represent the actions  that can be performed:<table>
 * <tr>
 * <th>API</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-icomhandleraction">IComHandlerAction</a>
 * </td>
 * <td>Represents an action that fires a handler.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iexecaction">IExecAction</a>
 * </td>
 * <td>Represents an action that executes a command-line operation.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iemailaction">IEmailAction</a>
 * </td>
 * <td>Represents an action that sends an email message.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ishowmessageaction">IShowMessageAction</a>
 * </td>
 * <td>Represents an action that shows a message box.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * When reading or writing XML, the actions of a task are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-actions-tasktype-element">Actions</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iaction
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IAction extends IDispatch {
    /**
     * The interface identifier for IAction
     * @type {Guid}
     */
    static IID := Guid("{bae54997-48b1-4cbe-9965-d6be263ebea4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAction interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id   : IntPtr
        put_Id   : IntPtr
        get_Type : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the identifier of the action. (Get)
     * @remarks
     * For information on how actions and tasks work together, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-actions">Task Actions</a>.
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iaction-get_id
     */
    get_Id(pId) {
        result := ComCall(7, this, BSTR.Ptr, pId, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the action. (Put)
     * @remarks
     * For information on how actions and tasks work together, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-actions">Task Actions</a>.
     * @param {BSTR} Id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iaction-put_id
     */
    put_Id(Id) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(8, this, BSTR, Id, "HRESULT")
        return result
    }

    /**
     * Gets the type of action.
     * @remarks
     * The action type is defined when the action is created and cannot be changed later. For information on creating an action, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iactioncollection-create">IActionCollection.Create</a>.
     * 
     * For information on how actions and tasks work together, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-actions">Task Actions</a>.
     * @param {Pointer<TASK_ACTION_TYPE>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iaction-get_type
     */
    get_Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.put_Id := CallbackCreate(GetMethod(implObj, "put_Id"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.put_Id)
        CallbackFree(this.vtbl.get_Type)
    }
}
