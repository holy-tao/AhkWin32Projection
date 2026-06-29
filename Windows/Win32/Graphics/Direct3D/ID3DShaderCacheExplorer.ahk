#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DShaderCacheExplorer extends IUnknown {
    /**
     * The interface identifier for ID3DShaderCacheExplorer
     * @type {Guid}
     */
    static IID := Guid("{90432322-32f5-487f-9264-e9390fa58b2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DShaderCacheExplorer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetApplicationFromExePath : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DShaderCacheExplorer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pFullExePath 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetApplicationFromExePath(pFullExePath, riid) {
        pFullExePath := pFullExePath is String ? StrPtr(pFullExePath) : pFullExePath

        result := ComCall(3, this, "ptr", pFullExePath, Guid.Ptr, riid, "ptr*", &ppvApp := 0, "HRESULT")
        return ppvApp
    }

    Query(iid) {
        if (ID3DShaderCacheExplorer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetApplicationFromExePath := CallbackCreate(GetMethod(implObj, "GetApplicationFromExePath"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetApplicationFromExePath)
    }
}
