#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\GPMReportType.ahk" { GPMReportType }
#Import ".\IGPMDomain2.ahk" { IGPMDomain2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMDomain3 extends IGPMDomain2 {
    /**
     * The interface identifier for IGPMDomain3
     * @type {Guid}
     */
    static IID := Guid("{0077fdfe-88c7-4acf-a11d-d10a7c310a03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMDomain3 interfaces
    */
    struct Vtbl extends IGPMDomain2.Vtbl {
        GenerateReport          : IntPtr
        get_InfrastructureDC    : IntPtr
        put_InfrastructureDC    : IntPtr
        put_InfrastructureFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMDomain3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    InfrastructureDC {
        get => this.get_InfrastructureDC()
        set => this.put_InfrastructureDC(value)
    }

    /**
     * @type {Integer} 
     */
    InfrastructureFlags {
        set => this.put_InfrastructureFlags(value)
    }

    /**
     * 
     * @param {GPMReportType} _gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @returns {IGPMResult} 
     */
    GenerateReport(_gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(23, this, GPMReportType, _gpmReportType, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InfrastructureDC() {
        pVal := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_InfrastructureDC(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(25, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_InfrastructureFlags(dwFlags) {
        result := ComCall(26, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMDomain3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GenerateReport := CallbackCreate(GetMethod(implObj, "GenerateReport"), flags, 5)
        this.vtbl.get_InfrastructureDC := CallbackCreate(GetMethod(implObj, "get_InfrastructureDC"), flags, 2)
        this.vtbl.put_InfrastructureDC := CallbackCreate(GetMethod(implObj, "put_InfrastructureDC"), flags, 2)
        this.vtbl.put_InfrastructureFlags := CallbackCreate(GetMethod(implObj, "put_InfrastructureFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GenerateReport)
        CallbackFree(this.vtbl.get_InfrastructureDC)
        CallbackFree(this.vtbl.put_InfrastructureDC)
        CallbackFree(this.vtbl.put_InfrastructureFlags)
    }
}
