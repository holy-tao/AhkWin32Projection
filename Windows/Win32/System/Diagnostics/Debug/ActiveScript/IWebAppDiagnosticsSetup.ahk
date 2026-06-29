#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IWebAppDiagnosticsSetup extends IUnknown {
    /**
     * The interface identifier for IWebAppDiagnosticsSetup
     * @type {Guid}
     */
    static IID := Guid("{379bfbe1-c6c9-432a-93e1-6d17656c538c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebAppDiagnosticsSetup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DiagnosticsSupported         : IntPtr
        CreateObjectWithSiteAtWebApp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebAppDiagnosticsSetup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    DiagnosticsSupported() {
        result := ComCall(3, this, VARIANT_BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer} hPassToObject 
     * @returns {HRESULT} 
     */
    CreateObjectWithSiteAtWebApp(rclsid, dwClsContext, riid, hPassToObject) {
        result := ComCall(4, this, Guid.Ptr, rclsid, "uint", dwClsContext, Guid.Ptr, riid, "ptr", hPassToObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebAppDiagnosticsSetup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DiagnosticsSupported := CallbackCreate(GetMethod(implObj, "DiagnosticsSupported"), flags, 2)
        this.vtbl.CreateObjectWithSiteAtWebApp := CallbackCreate(GetMethod(implObj, "CreateObjectWithSiteAtWebApp"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DiagnosticsSupported)
        CallbackFree(this.vtbl.CreateObjectWithSiteAtWebApp)
    }
}
