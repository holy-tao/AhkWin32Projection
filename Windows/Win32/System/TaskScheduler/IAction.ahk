#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the common properties inherited by all action objects.
 * @remarks
 * 
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
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iaction
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IAction extends IDispatch{
    /**
     * The interface identifier for IAction
     * @type {Guid}
     */
    static IID => Guid("{bae54997-48b1-4cbe-9965-d6be263ebea4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     */
    get_Id(pId) {
        result := ComCall(7, this, "ptr", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Id 
     * @returns {HRESULT} 
     */
    put_Id(Id) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(8, this, "ptr", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(9, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
