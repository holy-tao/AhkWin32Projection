#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VarArgsKind.ahk" { VarArgsKind }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostType2 extends IDebugHostType {
    /**
     * The interface identifier for IDebugHostType2
     * @type {Guid}
     */
    static IID := Guid("{b28632b9-8506-4676-87ce-8f7e05e59876}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostType2 interfaces
    */
    struct Vtbl extends IDebugHostType.Vtbl {
        IsTypedef                      : IntPtr
        GetTypedefBaseType             : IntPtr
        GetTypedefFinalBaseType        : IntPtr
        GetFunctionVarArgsKind         : IntPtr
        GetFunctionInstancePointerType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostType2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsTypedef() {
        result := ComCall(29, this, "int*", &isTypedef := 0, "HRESULT")
        return isTypedef
    }

    /**
     * 
     * @returns {IDebugHostType2} 
     */
    GetTypedefBaseType() {
        result := ComCall(30, this, "ptr*", &baseType := 0, "HRESULT")
        return IDebugHostType2(baseType)
    }

    /**
     * 
     * @returns {IDebugHostType2} 
     */
    GetTypedefFinalBaseType() {
        result := ComCall(31, this, "ptr*", &finalBaseType := 0, "HRESULT")
        return IDebugHostType2(finalBaseType)
    }

    /**
     * 
     * @returns {VarArgsKind} 
     */
    GetFunctionVarArgsKind() {
        result := ComCall(32, this, "int*", &_varArgsKind := 0, "HRESULT")
        return _varArgsKind
    }

    /**
     * 
     * @returns {IDebugHostType2} 
     */
    GetFunctionInstancePointerType() {
        result := ComCall(33, this, "ptr*", &instancePointerType := 0, "HRESULT")
        return IDebugHostType2(instancePointerType)
    }

    Query(iid) {
        if (IDebugHostType2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsTypedef := CallbackCreate(GetMethod(implObj, "IsTypedef"), flags, 2)
        this.vtbl.GetTypedefBaseType := CallbackCreate(GetMethod(implObj, "GetTypedefBaseType"), flags, 2)
        this.vtbl.GetTypedefFinalBaseType := CallbackCreate(GetMethod(implObj, "GetTypedefFinalBaseType"), flags, 2)
        this.vtbl.GetFunctionVarArgsKind := CallbackCreate(GetMethod(implObj, "GetFunctionVarArgsKind"), flags, 2)
        this.vtbl.GetFunctionInstancePointerType := CallbackCreate(GetMethod(implObj, "GetFunctionInstancePointerType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsTypedef)
        CallbackFree(this.vtbl.GetTypedefBaseType)
        CallbackFree(this.vtbl.GetTypedefFinalBaseType)
        CallbackFree(this.vtbl.GetFunctionVarArgsKind)
        CallbackFree(this.vtbl.GetFunctionInstancePointerType)
    }
}
