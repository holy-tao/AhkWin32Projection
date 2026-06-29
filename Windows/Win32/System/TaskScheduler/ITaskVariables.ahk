#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines task variables that can be passed as parameters to task handlers and external executables that are launched by tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itaskvariables
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskVariables extends IUnknown {
    /**
     * The interface identifier for ITaskVariables
     * @type {Guid}
     */
    static IID := Guid("{3e4c9351-d966-4b8b-bb87-ceba68bb0107}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskVariables interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInput   : IntPtr
        SetOutput  : IntPtr
        GetContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskVariables.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the input variables for a task.
     * @returns {BSTR} The input variables for a task.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskvariables-getinput
     */
    GetInput() {
        pInput := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pInput, "HRESULT")
        return pInput
    }

    /**
     * Sets the output variables for a task.
     * @param {BSTR} _input The output variables for a task.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskvariables-setoutput
     */
    SetOutput(_input) {
        _input := _input is String ? BSTR.Alloc(_input).Value : _input

        result := ComCall(4, this, BSTR, _input, "HRESULT")
        return result
    }

    /**
     * Used to share the context between different steps and tasks that are in the same job instance.
     * @returns {BSTR} The context that is used to share the context between different steps and tasks that are in the same job instance.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskvariables-getcontext
     */
    GetContext() {
        pContext := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pContext, "HRESULT")
        return pContext
    }

    Query(iid) {
        if (ITaskVariables.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInput := CallbackCreate(GetMethod(implObj, "GetInput"), flags, 2)
        this.vtbl.SetOutput := CallbackCreate(GetMethod(implObj, "SetOutput"), flags, 2)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInput)
        CallbackFree(this.vtbl.SetOutput)
        CallbackFree(this.vtbl.GetContext)
    }
}
