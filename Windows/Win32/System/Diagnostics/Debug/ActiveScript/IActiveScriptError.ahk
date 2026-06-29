#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptError extends IUnknown {
    /**
     * The interface identifier for IActiveScriptError
     * @type {Guid}
     */
    static IID := Guid("{eae1ba61-a4ed-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetExceptionInfo  : IntPtr
        GetSourcePosition : IntPtr
        GetSourceLineText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {EXCEPINFO} 
     */
    GetExceptionInfo() {
        pexcepinfo := EXCEPINFO()
        result := ComCall(3, this, EXCEPINFO.Ptr, pexcepinfo, "HRESULT")
        return pexcepinfo
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSourceContext 
     * @param {Pointer<Integer>} pulLineNumber 
     * @param {Pointer<Integer>} plCharacterPosition 
     * @returns {HRESULT} 
     */
    GetSourcePosition(pdwSourceContext, pulLineNumber, plCharacterPosition) {
        pdwSourceContextMarshal := pdwSourceContext is VarRef ? "uint*" : "ptr"
        pulLineNumberMarshal := pulLineNumber is VarRef ? "uint*" : "ptr"
        plCharacterPositionMarshal := plCharacterPosition is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pdwSourceContextMarshal, pdwSourceContext, pulLineNumberMarshal, pulLineNumber, plCharacterPositionMarshal, plCharacterPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSourceLineText() {
        pbstrSourceLine := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrSourceLine, "HRESULT")
        return pbstrSourceLine
    }

    Query(iid) {
        if (IActiveScriptError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExceptionInfo := CallbackCreate(GetMethod(implObj, "GetExceptionInfo"), flags, 2)
        this.vtbl.GetSourcePosition := CallbackCreate(GetMethod(implObj, "GetSourcePosition"), flags, 4)
        this.vtbl.GetSourceLineText := CallbackCreate(GetMethod(implObj, "GetSourceLineText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExceptionInfo)
        CallbackFree(this.vtbl.GetSourcePosition)
        CallbackFree(this.vtbl.GetSourceLineText)
    }
}
