#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\SignatureComparison.ahk" { SignatureComparison }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostType.ahk" { IDebugHostType }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostTypeSignature extends IUnknown {
    /**
     * The interface identifier for IDebugHostTypeSignature
     * @type {Guid}
     */
    static IID := Guid("{3aadc353-2b14-4abb-9893-5e03458e07ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostTypeSignature interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHashCode    : IntPtr
        IsMatch        : IntPtr
        CompareAgainst : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostTypeSignature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHashCode() {
        result := ComCall(3, this, "uint*", &hashCode := 0, "HRESULT")
        return hashCode
    }

    /**
     * 
     * @param {IDebugHostType} type 
     * @param {Pointer<Boolean>} isMatch 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    IsMatch(type, isMatch, wildcardMatches) {
        isMatchMarshal := isMatch is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", type, isMatchMarshal, isMatch, IDebugHostSymbolEnumerator.Ptr, wildcardMatches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @returns {SignatureComparison} 
     */
    CompareAgainst(typeSignature) {
        result := ComCall(5, this, "ptr", typeSignature, "int*", &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostTypeSignature.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHashCode := CallbackCreate(GetMethod(implObj, "GetHashCode"), flags, 2)
        this.vtbl.IsMatch := CallbackCreate(GetMethod(implObj, "IsMatch"), flags, 4)
        this.vtbl.CompareAgainst := CallbackCreate(GetMethod(implObj, "CompareAgainst"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHashCode)
        CallbackFree(this.vtbl.IsMatch)
        CallbackFree(this.vtbl.CompareAgainst)
    }
}
