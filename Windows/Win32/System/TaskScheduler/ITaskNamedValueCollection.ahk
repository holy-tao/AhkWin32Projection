#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITaskNamedValuePair.ahk" { ITaskNamedValuePair }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains a collection of ITaskNamedValuePair interface name-value pairs.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itasknamedvaluecollection
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskNamedValueCollection extends IDispatch {
    /**
     * The interface identifier for ITaskNamedValueCollection
     * @type {Guid}
     */
    static IID := Guid("{b4ef826b-63c3-46e4-a504-ef69e4f7ea4d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskNamedValueCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get_Item     : IntPtr
        get__NewEnum : IntPtr
        Create       : IntPtr
        Remove       : IntPtr
        Clear        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskNamedValueCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Gets the number of name-value pairs in the collection.
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Gets the specified name-value pair from the collection.
     * @param {Integer} index 
     * @returns {ITaskNamedValuePair} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &ppPair := 0, "HRESULT")
        return ITaskNamedValuePair(ppPair)
    }

    /**
     * Gets the collection enumerator for the name-value pair collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * Creates a name-value pair in the collection.
     * @param {BSTR} name The name associated with a value in a name-value pair.
     * @param {BSTR} value The value associated with a name in a name-value pair.
     * @returns {ITaskNamedValuePair} The name-value pair created in the collection.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itasknamedvaluepair">ITaskNamedValuePair</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-create
     */
    Create(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, BSTR, name, BSTR, value, "ptr*", &ppPair := 0, "HRESULT")
        return ITaskNamedValuePair(ppPair)
    }

    /**
     * Removes a selected name-value pair from the collection.
     * @param {Integer} index The index of the name-value pair to be removed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-remove
     */
    Remove(index) {
        result := ComCall(11, this, "int", index, "HRESULT")
        return result
    }

    /**
     * Clears the entire collection of name-value pairs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskNamedValueCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 4)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
    }
}
