#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsSyntax interface specifies methods to identify and modify the available Automation data types used to represent its data.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadssyntax
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsSyntax extends IADs {
    /**
     * The interface identifier for IADsSyntax
     * @type {Guid}
     */
    static IID := Guid("{c8f93dd2-4ae0-11cf-9e73-00aa004a5691}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsSyntax interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_OleAutoDataType : IntPtr
        put_OleAutoDataType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsSyntax.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    OleAutoDataType {
        get => this.get_OleAutoDataType()
        set => this.put_OleAutoDataType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OleAutoDataType() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnOleAutoDataType 
     * @returns {HRESULT} 
     */
    put_OleAutoDataType(lnOleAutoDataType) {
        result := ComCall(21, this, "int", lnOleAutoDataType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsSyntax.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_OleAutoDataType := CallbackCreate(GetMethod(implObj, "get_OleAutoDataType"), flags, 2)
        this.vtbl.put_OleAutoDataType := CallbackCreate(GetMethod(implObj, "put_OleAutoDataType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_OleAutoDataType)
        CallbackFree(this.vtbl.put_OleAutoDataType)
    }
}
