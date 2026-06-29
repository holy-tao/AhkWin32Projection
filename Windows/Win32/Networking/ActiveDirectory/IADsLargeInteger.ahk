#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to manipulate 64-bit integers of the LargeInteger type.
 * @remarks
 * Handling the <b>IADsLargeInteger</b> in Visual Basic is made difficult by the fact that Visual Basic has no native unsigned numeric data type. This can cause errors in data conversion if either the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadslargeinteger-property-methods">LowPart</a> or <b>HighPart</b> has the high bit set, which causes Visual Basic to handle the number as negative. The Visual Basic code examples below show how to properly handle the <b>IADsLargeInteger</b> in Visual Basic.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadslargeinteger
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsLargeInteger extends IDispatch {
    /**
     * The interface identifier for IADsLargeInteger
     * @type {Guid}
     */
    static IID := Guid("{9068270b-0939-11d1-8be1-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsLargeInteger interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_HighPart : IntPtr
        put_HighPart : IntPtr
        get_LowPart  : IntPtr
        put_LowPart  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsLargeInteger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    HighPart {
        get => this.get_HighPart()
        set => this.put_HighPart(value)
    }

    /**
     * @type {Integer} 
     */
    LowPart {
        get => this.get_LowPart()
        set => this.put_LowPart(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighPart() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnHighPart 
     * @returns {HRESULT} 
     */
    put_HighPart(lnHighPart) {
        result := ComCall(8, this, "int", lnHighPart, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowPart() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnLowPart 
     * @returns {HRESULT} 
     */
    put_LowPart(lnLowPart) {
        result := ComCall(10, this, "int", lnLowPart, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsLargeInteger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HighPart := CallbackCreate(GetMethod(implObj, "get_HighPart"), flags, 2)
        this.vtbl.put_HighPart := CallbackCreate(GetMethod(implObj, "put_HighPart"), flags, 2)
        this.vtbl.get_LowPart := CallbackCreate(GetMethod(implObj, "get_LowPart"), flags, 2)
        this.vtbl.put_LowPart := CallbackCreate(GetMethod(implObj, "put_LowPart"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HighPart)
        CallbackFree(this.vtbl.put_HighPart)
        CallbackFree(this.vtbl.get_LowPart)
        CallbackFree(this.vtbl.put_LowPart)
    }
}
