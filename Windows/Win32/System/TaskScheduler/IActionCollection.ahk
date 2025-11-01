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
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IAction>} ppAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-get_item
     */
    get_Item(index, ppAction) {
        result := ComCall(8, this, "int", index, "ptr*", ppAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(10, this, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(11, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<IAction>} ppAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-create
     */
    Create(type, ppAction) {
        result := ComCall(12, this, "int", type, "ptr*", ppAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-remove
     */
    Remove(index) {
        result := ComCall(13, this, "ptr", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-clear
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-get_context
     */
    get_Context(pContext) {
        result := ComCall(15, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iactioncollection-put_context
     */
    put_Context(context) {
        context := context is String ? BSTR.Alloc(context).Value : context

        result := ComCall(16, this, "ptr", context, "HRESULT")
        return result
    }
}
