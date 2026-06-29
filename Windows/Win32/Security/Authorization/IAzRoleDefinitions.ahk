#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a collection of IAzRoleDefinition objects.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazroledefinitions
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzRoleDefinitions extends IDispatch {
    /**
     * The interface identifier for IAzRoleDefinitions
     * @type {Guid}
     */
    static IID := Guid("{881f25a5-d755-4550-957a-d503a3b34001}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzRoleDefinitions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Item     : IntPtr
        get_Count    : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzRoleDefinitions.Vtbl()
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
     * Retrieves the IAzRoleDefinition object at the specified index in the IAzRoleDefinitions collection.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinitions-get_item
     */
    get_Item(Index) {
        pvarObtPtr := VARIANT()
        result := ComCall(7, this, "int", Index, VARIANT.Ptr, pvarObtPtr, "HRESULT")
        return pvarObtPtr
    }

    /**
     * Retrieves the number of IAzRoleDefinitions objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinitions-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves an IEnumVARIANT interface on an object that can be used to enumerate the IAzRoleDefinitions collection. This property is hidden within Visual Basic and Visual Basic Scripting Edition (VBScript).
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinitions-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnumPtr := 0, "HRESULT")
        return IUnknown(ppEnumPtr)
    }

    Query(iid) {
        if (IAzRoleDefinitions.IID.Equals(iid)) {
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
