#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IPackagedComSyntaxSupport extends IUnknown {
    /**
     * The interface identifier for IPackagedComSyntaxSupport
     * @type {Guid}
     */
    static IID := Guid("{8f146474-b228-48fb-a58c-105ebb273abc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPackagedComSyntaxSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSupportedVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPackagedComSyntaxSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSupportedVersion() {
        result := ComCall(3, this, "uint*", &supportedVersion := 0, "HRESULT")
        return supportedVersion
    }

    Query(iid) {
        if (IPackagedComSyntaxSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSupportedVersion := CallbackCreate(GetMethod(implObj, "GetSupportedVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSupportedVersion)
    }
}
