#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Creates a name-value pair in which the name is associated with the value.
 * @remarks
 * When reading or writing your own XML for a task, a name-value pair is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-valuequeries-eventtriggertype-element">ValueQueries</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itasknamedvaluepair
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskNamedValuePair extends IDispatch {
    /**
     * The interface identifier for ITaskNamedValuePair
     * @type {Guid}
     */
    static IID := Guid("{39038068-2b46-4afd-8662-7bb6f868d221}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskNamedValuePair interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name  : IntPtr
        put_Name  : IntPtr
        get_Value : IntPtr
        put_Value : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskNamedValuePair.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the name that is associated with a value in a name-value pair. (Get)
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluepair-get_name
     */
    get_Name(pName) {
        result := ComCall(7, this, BSTR.Ptr, pName, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name that is associated with a value in a name-value pair. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluepair-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that is associated with a name in a name-value pair. (Get)
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluepair-get_value
     */
    get_Value(pValue) {
        result := ComCall(9, this, BSTR.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * Gets or sets the value that is associated with a name in a name-value pair. (Put)
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluepair-put_value
     */
    put_Value(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, BSTR, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskNamedValuePair.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
    }
}
