#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPropertyChange.ahk" { IPropertyChange }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for several multiple change operations that may be passed to IFileOperation.
 * @remarks
 * Either call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class identifier (CLSID) of <b>CLSID_PropertyChangeArray</b> or call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatepropertychangearray">PSCreatePropertyChangeArray</a> to obtain a standard implementation of this interface. This is a container interface that allows multiple changes to be passed to a single file operation to prevent accessing a file multiple times.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertychangearray
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyChangeArray extends IUnknown {
    /**
     * The interface identifier for IPropertyChangeArray
     * @type {Guid}
     */
    static IID := Guid("{380f5cad-1b5e-42f2-805d-637fd392d31e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyChangeArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount        : IntPtr
        GetAt           : IntPtr
        InsertAt        : IntPtr
        Append          : IntPtr
        AppendOrReplace : IntPtr
        RemoveAt        : IntPtr
        IsKeyInArray    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyChangeArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of change operations in the array.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to the number of change operations.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcOperations := 0, "HRESULT")
        return pcOperations
    }

    /**
     * Gets the change operation at a specified array index.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the change to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the interface specified by <i>riid</i>, usually <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-getat
     */
    GetAt(iIndex, riid) {
        result := ComCall(4, this, "uint", iIndex, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Inserts a change operation into an array at the specified position.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index at which the change is inserted.
     * @param {IPropertyChange} ppropChange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>*</b>
     * 
     * A pointer to the interface that contains the change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-insertat
     */
    InsertAt(iIndex, ppropChange) {
        result := ComCall(5, this, "uint", iIndex, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * Inserts a change operation at the end of an array.
     * @param {IPropertyChange} ppropChange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>*</b>
     * 
     * A pointer to the interface that contains the change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-append
     */
    Append(ppropChange) {
        result := ComCall(6, this, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * Replaces the first occurrence of a change that affects the same property key as the provided change. If the property key is not already in the array, this method appends the change to the end of the array.
     * @param {IPropertyChange} ppropChange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>*</b>
     * 
     * A pointer to the interface that contains the change
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-appendorreplace
     */
    AppendOrReplace(ppropChange) {
        result := ComCall(7, this, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * Removes a specified change.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the change to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-removeat
     */
    RemoveAt(iIndex) {
        result := ComCall(8, this, "uint", iIndex, "HRESULT")
        return result
    }

    /**
     * Specifies whether a particular property key exists in the change array.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure of interest.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if key is found; otherwise, E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-iskeyinarray
     */
    IsKeyInArray(key) {
        result := ComCall(9, this, PROPERTYKEY.Ptr, key, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyChangeArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 4)
        this.vtbl.InsertAt := CallbackCreate(GetMethod(implObj, "InsertAt"), flags, 3)
        this.vtbl.Append := CallbackCreate(GetMethod(implObj, "Append"), flags, 2)
        this.vtbl.AppendOrReplace := CallbackCreate(GetMethod(implObj, "AppendOrReplace"), flags, 2)
        this.vtbl.RemoveAt := CallbackCreate(GetMethod(implObj, "RemoveAt"), flags, 2)
        this.vtbl.IsKeyInArray := CallbackCreate(GetMethod(implObj, "IsKeyInArray"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.InsertAt)
        CallbackFree(this.vtbl.Append)
        CallbackFree(this.vtbl.AppendOrReplace)
        CallbackFree(this.vtbl.RemoveAt)
        CallbackFree(this.vtbl.IsKeyInArray)
    }
}
