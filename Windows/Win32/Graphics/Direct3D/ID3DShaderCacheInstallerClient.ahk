#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE.ahk" { D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE }
#Import ".\ID3DShaderCacheInstaller.ahk" { ID3DShaderCacheInstaller }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DShaderCacheInstallerClient extends Win32ComInterface {
    /**
     * The interface identifier for ID3DShaderCacheInstallerClient
     * @type {Guid}
     */
    static IID := Guid("{a16ee930-d9f6-4222-a514-244473e5d266}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DShaderCacheInstallerClient interfaces
    */
    struct Vtbl {
        GetInstallerName   : IntPtr
        GetInstallerScope  : IntPtr
        HandleDriverUpdate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DShaderCacheInstallerClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pNameLength 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    GetInstallerName(pNameLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        pNameLengthMarshal := pNameLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(0, this, pNameLengthMarshal, pNameLength, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE} 
     */
    GetInstallerScope() {
        result := ComCall(1, this, D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE)
        return result
    }

    /**
     * 
     * @param {ID3DShaderCacheInstaller} pInstaller 
     * @returns {HRESULT} 
     */
    HandleDriverUpdate(pInstaller) {
        result := ComCall(2, this, "ptr", pInstaller, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3DShaderCacheInstallerClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
