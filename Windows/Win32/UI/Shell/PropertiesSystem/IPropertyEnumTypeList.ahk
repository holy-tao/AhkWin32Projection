#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enumerate the possible values for a property.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertyenumtypelist
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyEnumTypeList extends IUnknown {
    /**
     * The interface identifier for IPropertyEnumTypeList
     * @type {Guid}
     */
    static IID := Guid("{a99400f4-3d84-4557-94ba-1242fb2cc9a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyEnumTypeList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount          : IntPtr
        GetAt             : IntPtr
        GetConditionAt    : IntPtr
        FindMatchingIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyEnumTypeList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of elements in the list.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of list elements.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pctypes := 0, "HRESULT")
        return pctypes
    }

    /**
     * Gets the IPropertyEnumType object at the specified index in the list.
     * @param {Integer} itype Type: <b>UINT</b>
     * 
     * The index of the object in the list.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through ppv, typically IID_IShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in riid. This is typically [IPropertyEnumType](nn-propsys-ipropertyenumtype.md).
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-getat
     */
    GetAt(itype, riid) {
        result := ComCall(4, this, "uint", itype, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Not supported.Gets the condition at the specified index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * Index of the desired condition.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-getconditionat
     */
    GetConditionAt(nIndex, riid) {
        result := ComCall(5, this, "uint", nIndex, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Compares the specified property value against the enumerated values in a list and returns the matching index.
     * @param {Pointer<PROPVARIANT>} propvarCmp Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that represents the property value.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index in the enumerated type list that matches the property value, if any.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-findmatchingindex
     */
    FindMatchingIndex(propvarCmp) {
        result := ComCall(6, this, PROPVARIANT.Ptr, propvarCmp, "uint*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }

    Query(iid) {
        if (IPropertyEnumTypeList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 4)
        this.vtbl.GetConditionAt := CallbackCreate(GetMethod(implObj, "GetConditionAt"), flags, 4)
        this.vtbl.FindMatchingIndex := CallbackCreate(GetMethod(implObj, "FindMatchingIndex"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.GetConditionAt)
        CallbackFree(this.vtbl.FindMatchingIndex)
    }
}
