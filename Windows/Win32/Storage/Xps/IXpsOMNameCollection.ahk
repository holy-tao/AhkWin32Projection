#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A collection of name strings.
 * @remarks
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomnamecollection
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMNameCollection extends IUnknown {
    /**
     * The interface identifier for IXpsOMNameCollection
     * @type {Guid}
     */
    static IID := Guid("{4bddf8ec-c915-421b-a166-d173d25653d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMNameCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMNameCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of name strings in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of name strings in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomnamecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets the name string that is stored at a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * 
     * This method allocates the memory used by the string that is returned in <i>name</i>.  If <i>name</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @param {Integer} index The zero-based index of the collection that contains the name string to be obtained.
     * @returns {PWSTR} The name string at the location specified by <i>index</i>.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomnamecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, PWSTR.Ptr, &name := 0, "HRESULT")
        return name
    }

    Query(iid) {
        if (IXpsOMNameCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
    }
}
