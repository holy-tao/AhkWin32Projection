#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPMGPO2.ahk" { IGPMGPO2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMGPO3 extends IGPMGPO2 {
    /**
     * The interface identifier for IGPMGPO3
     * @type {Guid}
     */
    static IID := Guid("{7cf123a1-f94a-4112-bfae-6aa1db9cb248}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMGPO3 interfaces
    */
    struct Vtbl extends IGPMGPO2.Vtbl {
        get_InfrastructureDC    : IntPtr
        put_InfrastructureDC    : IntPtr
        put_InfrastructureFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMGPO3.Vtbl()
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
     * @returns {BSTR} 
     */
    get_InfrastructureDC() {
        pVal := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_InfrastructureDC(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(39, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_InfrastructureFlags(dwFlags) {
        result := ComCall(40, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMGPO3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_InfrastructureDC := CallbackCreate(GetMethod(implObj, "get_InfrastructureDC"), flags, 2)
        this.vtbl.put_InfrastructureDC := CallbackCreate(GetMethod(implObj, "put_InfrastructureDC"), flags, 2)
        this.vtbl.put_InfrastructureFlags := CallbackCreate(GetMethod(implObj, "put_InfrastructureFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_InfrastructureDC)
        CallbackFree(this.vtbl.put_InfrastructureDC)
        CallbackFree(this.vtbl.put_InfrastructureFlags)
    }
}
