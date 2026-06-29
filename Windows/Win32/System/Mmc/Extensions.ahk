#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Extension.ahk" { Extension }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The X.509 version 3 certificate format identifies multiple extensions that can be added to a certificate.
 * @see https://learn.microsoft.com/windows/win32/SecCertEnroll/extensions
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Extensions extends IDispatch {
    /**
     * The interface identifier for Extensions
     * @type {Guid}
     */
    static IID := Guid("{82dbea43-8ca4-44bc-a2ca-d18741059ec8}")

    /**
     * The class identifier for Extensions
     * @type {Guid}
     */
    static CLSID := Guid("{82dbea43-8ca4-44bc-a2ca-d18741059ec8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Extensions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        Item         : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Extensions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * The Item property retrieves an extension, by index, from the collection. This is the default property.
     * @param {Integer} Index 
     * @returns {Extension} 
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/extensions-item
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &_Extension := 0, "HRESULT")
        return Extension(_Extension)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    Query(iid) {
        if (Extensions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get_Count)
    }
}
