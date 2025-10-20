#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAction.ahk

/**
 * Represents an action that fires a handler.
 * @remarks
 * 
  * COM handlers must implement the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandler">ITaskHandler</a> interface for the Task Scheduler to start and stop the handler. In turn, the COM handler uses the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandlerstatus">ITaskHandlerStatus</a> interface to communicate the status back to the Task Scheduler.
  * 
  * When reading or writing XML, a COM handler action is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-comhandler-actiongroup-element">ComHandler</a> element of the Task Scheduler schema.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-icomhandleraction
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IComHandlerAction extends IAction{
    /**
     * The interface identifier for IComHandlerAction
     * @type {Guid}
     */
    static IID => Guid("{6d2fd252-75c5-4f66-90ba-2a7d8cc3039f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<BSTR>} pClsid 
     * @returns {HRESULT} 
     */
    get_ClassId(pClsid) {
        result := ComCall(10, this, "ptr", pClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} clsid 
     * @returns {HRESULT} 
     */
    put_ClassId(clsid) {
        clsid := clsid is String ? BSTR.Alloc(clsid).Value : clsid

        result := ComCall(11, this, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     */
    get_Data(pData) {
        result := ComCall(12, this, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(13, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
