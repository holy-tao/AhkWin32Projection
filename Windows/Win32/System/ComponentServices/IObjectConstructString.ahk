#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides access to a constructor string. Use it when you want to specify the parameters during the construction of your object.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectconstructstring
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectConstructString extends IDispatch {
    /**
     * The interface identifier for IObjectConstructString
     * @type {Guid}
     */
    static IID := Guid("{41c4f8b2-7439-11d2-98cb-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectConstructString interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ConstructString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectConstructString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    ConstructString {
        get => this.get_ConstructString()
    }

    /**
     * Retrieves the constructor string for the object.
     * @remarks
     * You can use this method when implementing <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectconstruct-construct">IObjectConstruct::Construct</a>, which is called by the COM+ environment when your component is marked as supporting object construction.
     * @param {Pointer<BSTR>} pVal A reference to an administratively supplied object constructor string.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectconstructstring-get_constructstring
     */
    get_ConstructString(pVal) {
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectConstructString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ConstructString := CallbackCreate(GetMethod(implObj, "get_ConstructString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ConstructString)
    }
}
