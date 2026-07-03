#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3DShaderCacheInstallerClient.ahk" { ID3DShaderCacheInstallerClient }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DShaderCacheInstallerFactory extends IUnknown {
    /**
     * The interface identifier for ID3DShaderCacheInstallerFactory
     * @type {Guid}
     */
    static IID := Guid("{09b2dfe4-840f-401a-804c-0dd8aadc9e9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DShaderCacheInstallerFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstaller : IntPtr
        CreateExplorer  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DShaderCacheInstallerFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3DShaderCacheInstallerClient} pClient 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateInstaller(pClient, riid) {
        result := ComCall(3, this, "ptr", pClient, Guid.Ptr, riid, "ptr*", &ppvInstaller := 0, "HRESULT")
        return ppvInstaller
    }

    /**
     * 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateExplorer(pUnknown, riid) {
        result := ComCall(4, this, "ptr", pUnknown, Guid.Ptr, riid, "ptr*", &ppvExplorer := 0, "HRESULT")
        return ppvExplorer
    }

    Query(iid) {
        if (ID3DShaderCacheInstallerFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstaller := CallbackCreate(GetMethod(implObj, "CreateInstaller"), flags, 4)
        this.vtbl.CreateExplorer := CallbackCreate(GetMethod(implObj, "CreateExplorer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstaller)
        CallbackFree(this.vtbl.CreateExplorer)
    }
}
