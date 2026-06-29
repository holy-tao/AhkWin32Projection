#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWscProduct2.ahk" { IWscProduct2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct IWscProduct3 extends IWscProduct2 {
    /**
     * The interface identifier for IWscProduct3
     * @type {Guid}
     */
    static IID := Guid("{55536524-d1d1-4726-8c7c-04996a1904e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWscProduct3 interfaces
    */
    struct Vtbl extends IWscProduct2.Vtbl {
        get_AntivirusDaysUntilExpired : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWscProduct3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    AntivirusDaysUntilExpired {
        get => this.get_AntivirusDaysUntilExpired()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AntivirusDaysUntilExpired() {
        result := ComCall(20, this, "uint*", &pdwDays := 0, "HRESULT")
        return pdwDays
    }

    Query(iid) {
        if (IWscProduct3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AntivirusDaysUntilExpired := CallbackCreate(GetMethod(implObj, "get_AntivirusDaysUntilExpired"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AntivirusDaysUntilExpired)
    }
}
