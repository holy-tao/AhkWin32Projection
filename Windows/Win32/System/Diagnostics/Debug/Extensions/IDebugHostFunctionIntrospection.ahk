#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugHostFunctionLocalDetailsEnumerator.ahk" { IDebugHostFunctionLocalDetailsEnumerator }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostFunctionIntrospection extends IUnknown {
    /**
     * The interface identifier for IDebugHostFunctionIntrospection
     * @type {Guid}
     */
    static IID := Guid("{a754393c-4fbe-4178-8ad5-fe6079ac048d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostFunctionIntrospection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumerateLocalsDetails        : IntPtr
        EnumerateInlineFunctionsByRVA : IntPtr
        FindContainingCodeRangeByRVA  : IntPtr
        FindSourceLocationByRVA       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostFunctionIntrospection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugHostFunctionLocalDetailsEnumerator} 
     */
    EnumerateLocalsDetails() {
        result := ComCall(3, this, "ptr*", &localsEnum := 0, "HRESULT")
        return IDebugHostFunctionLocalDetailsEnumerator(localsEnum)
    }

    /**
     * 
     * @param {Integer} rva 
     * @returns {IDebugHostSymbolEnumerator} 
     */
    EnumerateInlineFunctionsByRVA(rva) {
        result := ComCall(4, this, "uint", rva, "ptr*", &inlinesEnum := 0, "HRESULT")
        return IDebugHostSymbolEnumerator(inlinesEnum)
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<Location>} rangeStart 
     * @param {Pointer<Location>} rangeEnd 
     * @returns {HRESULT} 
     */
    FindContainingCodeRangeByRVA(rva, rangeStart, rangeEnd) {
        result := ComCall(5, this, "uint", rva, Location.Ptr, rangeStart, Location.Ptr, rangeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<BSTR>} _sourceFile 
     * @param {Pointer<Integer>} sourceLine 
     * @returns {HRESULT} 
     */
    FindSourceLocationByRVA(rva, _sourceFile, sourceLine) {
        sourceLineMarshal := sourceLine is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", rva, BSTR.Ptr, _sourceFile, sourceLineMarshal, sourceLine, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostFunctionIntrospection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateLocalsDetails := CallbackCreate(GetMethod(implObj, "EnumerateLocalsDetails"), flags, 2)
        this.vtbl.EnumerateInlineFunctionsByRVA := CallbackCreate(GetMethod(implObj, "EnumerateInlineFunctionsByRVA"), flags, 3)
        this.vtbl.FindContainingCodeRangeByRVA := CallbackCreate(GetMethod(implObj, "FindContainingCodeRangeByRVA"), flags, 4)
        this.vtbl.FindSourceLocationByRVA := CallbackCreate(GetMethod(implObj, "FindSourceLocationByRVA"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateLocalsDetails)
        CallbackFree(this.vtbl.EnumerateInlineFunctionsByRVA)
        CallbackFree(this.vtbl.FindContainingCodeRangeByRVA)
        CallbackFree(this.vtbl.FindSourceLocationByRVA)
    }
}
