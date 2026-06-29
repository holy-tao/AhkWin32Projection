#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\ITypeInfo.ahk" { ITypeInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\DISPPARAMS.ahk" { DISPPARAMS }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IPrivateDispatch extends IUnknown {
    /**
     * The interface identifier for IPrivateDispatch
     * @type {Guid}
     */
    static IID := Guid("{86ab4bbe-65f6-11d1-8c13-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrivateDispatch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ADSIInitializeDispatchManager : IntPtr
        ADSIGetTypeInfoCount          : IntPtr
        ADSIGetTypeInfo               : IntPtr
        ADSIGetIDsOfNames             : IntPtr
        ADSIInvoke                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrivateDispatch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwExtensionId 
     * @returns {HRESULT} 
     */
    ADSIInitializeDispatchManager(dwExtensionId) {
        result := ComCall(3, this, "int", dwExtensionId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    ADSIGetTypeInfoCount() {
        result := ComCall(4, this, "uint*", &pctinfo := 0, "HRESULT")
        return pctinfo
    }

    /**
     * 
     * @param {Integer} itinfo 
     * @param {Integer} lcid 
     * @returns {ITypeInfo} 
     */
    ADSIGetTypeInfo(itinfo, lcid) {
        result := ComCall(5, this, "uint", itinfo, "uint", lcid, "ptr*", &pptinfo := 0, "HRESULT")
        return ITypeInfo(pptinfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Integer>>} rgszNames 
     * @param {Integer} cNames 
     * @param {Integer} lcid 
     * @returns {Integer} 
     */
    ADSIGetIDsOfNames(riid, rgszNames, cNames, lcid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, Guid.Ptr, riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, "int*", &rgdispid := 0, "HRESULT")
        return rgdispid
    }

    /**
     * 
     * @param {Integer} dispidMember 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @param {Pointer<Integer>} puArgErr 
     * @returns {HRESULT} 
     */
    ADSIInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", dispidMember, Guid.Ptr, riid, "uint", lcid, "ushort", wFlags, DISPPARAMS.Ptr, pdispparams, VARIANT.Ptr, pvarResult, EXCEPINFO.Ptr, pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrivateDispatch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ADSIInitializeDispatchManager := CallbackCreate(GetMethod(implObj, "ADSIInitializeDispatchManager"), flags, 2)
        this.vtbl.ADSIGetTypeInfoCount := CallbackCreate(GetMethod(implObj, "ADSIGetTypeInfoCount"), flags, 2)
        this.vtbl.ADSIGetTypeInfo := CallbackCreate(GetMethod(implObj, "ADSIGetTypeInfo"), flags, 4)
        this.vtbl.ADSIGetIDsOfNames := CallbackCreate(GetMethod(implObj, "ADSIGetIDsOfNames"), flags, 6)
        this.vtbl.ADSIInvoke := CallbackCreate(GetMethod(implObj, "ADSIInvoke"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ADSIInitializeDispatchManager)
        CallbackFree(this.vtbl.ADSIGetTypeInfoCount)
        CallbackFree(this.vtbl.ADSIGetTypeInfo)
        CallbackFree(this.vtbl.ADSIGetIDsOfNames)
        CallbackFree(this.vtbl.ADSIInvoke)
    }
}
