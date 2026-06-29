#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a collection of IAzRole objects.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazroles
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzRoles extends IDispatch {
    /**
     * The interface identifier for IAzRoles
     * @type {Guid}
     */
    static IID := Guid("{95e0f119-13b4-4dae-b65f-2f7d60d822e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzRoles interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Item     : IntPtr
        get_Count    : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzRoles.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
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
     * Retrieves the IAzRole object at the specified index into the IAzRoles collection.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroles-get_item
     */
    get_Item(Index) {
        pvarObtPtr := VARIANT()
        result := ComCall(7, this, "int", Index, VARIANT.Ptr, pvarObtPtr, "HRESULT")
        return pvarObtPtr
    }

    /**
     * Retrieves the number of IAzRole objects in the collection.
     * @remarks
     * The <b>Count</b> property can be used to specify the last <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object in a collection when retrieving a specific <b>IAzRole</b> object using the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazroles-get_item">IAzRoles.Item</a> property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroles-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The _NewEnum property of IAzRoles retrieves an IEnumVARIANT interface on an object that can be used to enumerate the collection. This property is hidden within Visual Basic and Visual Basic Scripting Edition (VBScript).
     * @remarks
     * This property is provided for use by the <c>For Each</code> keyword in Visual Basic and the <code>foreach</c> keyword in Visual C#.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroles-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnumPtr := 0, "HRESULT")
        return IUnknown(ppEnumPtr)
    }

    Query(iid) {
        if (IAzRoles.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
