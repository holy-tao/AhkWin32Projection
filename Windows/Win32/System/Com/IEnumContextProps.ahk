#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ContextProperty.ahk" { ContextProperty }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IEnumContextProps (objidlbase.h) interface provides a mechanism for enumerating the context properties associated with a COM+ object context.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ienumcontextprops
 * @namespace Windows.Win32.System.Com
 */
export default struct IEnumContextProps extends IUnknown {
    /**
     * The interface identifier for IEnumContextProps
     * @type {Guid}
     */
    static IID := Guid("{000001c1-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumContextProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
        Count : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumContextProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IEnumContextProps::Next (objidlbase.h) method retrieves the specified number of items in the enumeration sequence.
     * @param {Integer} celt The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * @param {Pointer<ContextProperty>} pContextProperties An array of enumerated items.
     * 
     * The enumerator is responsible for allocating any memory, and the caller is responsible for freeing it. If <i>celt</i> is greater than 1, the caller must also pass a non-NULL pointer passed to <i>pceltFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pceltFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-next
     */
    Next(celt, pContextProperties, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ContextProperty.Ptr, pContextProperties, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumContextProps::Skip (objidlbase.h) method skips over the specified number of items in the enumeration sequence.
     * @param {Integer} celt The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumContextProps::Reset (objidlbase.h) method resets the enumeration sequence to the beginning.
     * @remarks
     * There is no guarantee that the same set of objects will be enumerated after the reset operation has completed. A static collection is reset to the beginning, but it can be too expensive for some collections, such as files in a directory, to guarantee this condition.
     * @returns {HRESULT} The return value is S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumContextProps::Clone (objidlbase.h) method creates a new enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumContextProps} A pointer to the cloned enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumContextProps := 0, "HRESULT")
        return IEnumContextProps(ppEnumContextProps)
    }

    /**
     * The IEnumContextProps::Count (objidlbase.h) method retrieves the number of context properties in the context.
     * @returns {Integer} The count of items in the sequence.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-count
     */
    Count() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    Query(iid) {
        if (IEnumContextProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.Count := CallbackCreate(GetMethod(implObj, "Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.Count)
    }
}
