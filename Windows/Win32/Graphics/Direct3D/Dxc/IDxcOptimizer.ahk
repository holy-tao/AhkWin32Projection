#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcOptimizerPass.ahk" { IDxcOptimizerPass }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcOptimizer extends IUnknown {
    /**
     * The interface identifier for IDxcOptimizer
     * @type {Guid}
     */
    static IID := Guid("{25740e2e-9cba-401b-9119-4fb42f39f270}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcOptimizer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAvailablePassCount : IntPtr
        GetAvailablePass      : IntPtr
        RunOptimizer          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcOptimizer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAvailablePassCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDxcOptimizerPass} 
     */
    GetAvailablePass(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOptimizerPass(ppResult)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Pointer<PWSTR>} ppOptions 
     * @param {Integer} optionCount 
     * @param {Pointer<IDxcBlob>} pOutputModule 
     * @param {Pointer<IDxcBlobEncoding>} ppOutputText 
     * @returns {HRESULT} 
     */
    RunOptimizer(pBlob, ppOptions, optionCount, pOutputModule, ppOutputText) {
        ppOptionsMarshal := ppOptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pBlob, ppOptionsMarshal, ppOptions, "uint", optionCount, IDxcBlob.Ptr, pOutputModule, IDxcBlobEncoding.Ptr, ppOutputText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDxcOptimizer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAvailablePassCount := CallbackCreate(GetMethod(implObj, "GetAvailablePassCount"), flags, 2)
        this.vtbl.GetAvailablePass := CallbackCreate(GetMethod(implObj, "GetAvailablePass"), flags, 3)
        this.vtbl.RunOptimizer := CallbackCreate(GetMethod(implObj, "RunOptimizer"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAvailablePassCount)
        CallbackFree(this.vtbl.GetAvailablePass)
        CallbackFree(this.vtbl.RunOptimizer)
    }
}
