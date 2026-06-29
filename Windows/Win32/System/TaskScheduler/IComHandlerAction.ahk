#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAction.ahk" { IAction }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents an action that fires a handler.
 * @remarks
 * COM handlers must implement the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandler">ITaskHandler</a> interface for the Task Scheduler to start and stop the handler. In turn, the COM handler uses the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandlerstatus">ITaskHandlerStatus</a> interface to communicate the status back to the Task Scheduler.
 * 
 * When reading or writing XML, a COM handler action is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-comhandler-actiongroup-element">ComHandler</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-icomhandleraction
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IComHandlerAction extends IAction {
    /**
     * The interface identifier for IComHandlerAction
     * @type {Guid}
     */
    static IID := Guid("{6d2fd252-75c5-4f66-90ba-2a7d8cc3039f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComHandlerAction interfaces
    */
    struct Vtbl extends IAction.Vtbl {
        get_ClassId : IntPtr
        put_ClassId : IntPtr
        get_Data    : IntPtr
        put_Data    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComHandlerAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ClassId {
        get => this.get_ClassId()
        set => this.put_ClassId(value)
    }

    /**
     * @type {BSTR} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets or sets the identifier of the handler class. (Get)
     * @remarks
     * When reading or writing XML, the class of a COM handler is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-classid-comhandlertype-element">ClassId</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-get_classid
     */
    get_ClassId(pClsid) {
        result := ComCall(10, this, BSTR.Ptr, pClsid, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the handler class. (Put)
     * @remarks
     * When reading or writing XML, the class of a COM handler is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-classid-comhandlertype-element">ClassId</a> element of the Task Scheduler schema.
     * @param {BSTR} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-put_classid
     */
    put_ClassId(clsid) {
        clsid := clsid is String ? BSTR.Alloc(clsid).Value : clsid

        result := ComCall(11, this, BSTR, clsid, "HRESULT")
        return result
    }

    /**
     * Gets or sets additional data that is associated with the handler. (Get)
     * @remarks
     * When reading or writing XML, the data of a COM handler is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-data-comhandlertype-element">Data</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-get_data
     */
    get_Data(pData) {
        result := ComCall(12, this, BSTR.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * Gets or sets additional data that is associated with the handler. (Put)
     * @remarks
     * When reading or writing XML, the data of a COM handler is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-data-comhandlertype-element">Data</a> element of the Task Scheduler schema.
     * @param {BSTR} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-icomhandleraction-put_data
     */
    put_Data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(13, this, BSTR, data, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComHandlerAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ClassId := CallbackCreate(GetMethod(implObj, "get_ClassId"), flags, 2)
        this.vtbl.put_ClassId := CallbackCreate(GetMethod(implObj, "put_ClassId"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ClassId)
        CallbackFree(this.vtbl.put_ClassId)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
    }
}
