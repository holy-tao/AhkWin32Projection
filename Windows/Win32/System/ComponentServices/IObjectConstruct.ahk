#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the object construction process by passing in parameters from other methods or objects.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectconstruct
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectConstruct extends IUnknown {
    /**
     * The interface identifier for IObjectConstruct
     * @type {Guid}
     */
    static IID := Guid("{41c4f8b3-7439-11d2-98cb-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectConstruct interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Construct : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectConstruct.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Constructs an object using the specified parameters.
     * @param {IDispatch} pCtorObj A reference to an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectconstructstring">IObjectConstructString</a> interface.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectconstruct-construct
     */
    Construct(pCtorObj) {
        result := ComCall(3, this, "ptr", pCtorObj, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectConstruct.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Construct := CallbackCreate(GetMethod(implObj, "Construct"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Construct)
    }
}
