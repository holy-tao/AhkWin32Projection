#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Ole\CAUUID.ahk" { CAUUID }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ISpecifyParticularPages extends IUnknown {
    /**
     * The interface identifier for ISpecifyParticularPages
     * @type {Guid}
     */
    static IID := Guid("{4c437b91-6e9e-11d1-a704-006097c4e476}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpecifyParticularPages interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPages : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpecifyParticularPages.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} guidWhatPages 
     * @returns {CAUUID} 
     */
    GetPages(guidWhatPages) {
        pPages := CAUUID()
        result := ComCall(3, this, Guid.Ptr, guidWhatPages, CAUUID.Ptr, pPages, "HRESULT")
        return pPages
    }

    Query(iid) {
        if (ISpecifyParticularPages.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPages := CallbackCreate(GetMethod(implObj, "GetPages"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPages)
    }
}
