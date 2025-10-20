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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClassId", "put_ClassId", "get_Data", "put_Data"]

    /**
     * 
     * @param {Pointer<BSTR>} pClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-get_classid
     */
    get_ClassId(pClsid) {
        result := ComCall(10, this, "ptr", pClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-put_classid
     */
    put_ClassId(clsid) {
        clsid := clsid is String ? BSTR.Alloc(clsid).Value : clsid

        result := ComCall(11, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-get_data
     */
    get_Data(pData) {
        result := ComCall(12, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-put_data
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(13, this, "ptr", data, "HRESULT")
        return result
    }
}
