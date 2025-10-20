#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(7, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IAction>} ppAction 
     * @returns {HRESULT} 
     */
    get_Item(index, ppAction) {
        result := ComCall(8, this, "int", index, "ptr", ppAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     */
    get_XmlText(pText) {
        result := ComCall(10, this, "ptr", pText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(11, this, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<IAction>} ppAction 
     * @returns {HRESULT} 
     */
    Create(type, ppAction) {
        result := ComCall(12, this, "int", type, "ptr", ppAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {HRESULT} 
     */
    Remove(index) {
        result := ComCall(13, this, "ptr", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pContext 
     * @returns {HRESULT} 
     */
    get_Context(pContext) {
        result := ComCall(15, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} context 
     * @returns {HRESULT} 
     */
    put_Context(context) {
        context := context is String ? BSTR.Alloc(context).Value : context

        result := ComCall(16, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
