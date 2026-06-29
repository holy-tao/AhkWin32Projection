#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12CompilerCacheSession.ahk" { ID3D12CompilerCacheSession }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_ADAPTER_FAMILY.ahk" { D3D12_ADAPTER_FAMILY }
#Import ".\D3D12_COMPILER_DATABASE_PATH.ahk" { D3D12_COMPILER_DATABASE_PATH }
#Import ".\D3D12_VERSION_NUMBER.ahk" { D3D12_VERSION_NUMBER }
#Import ".\D3D12_APPLICATION_DESC.ahk" { D3D12_APPLICATION_DESC }
#Import ".\D3D12_COMPILER_TARGET.ahk" { D3D12_COMPILER_TARGET }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12CompilerFactory extends IUnknown {
    /**
     * The interface identifier for ID3D12CompilerFactory
     * @type {Guid}
     */
    static IID := Guid("{c1ee4b59-3f59-47a5-9b4e-a855c858a878}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12CompilerFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumerateAdapterFamilies              : IntPtr
        EnumerateAdapterFamilyABIVersions     : IntPtr
        EnumerateAdapterFamilyCompilerVersion : IntPtr
        GetApplicationProfileVersion          : IntPtr
        CreateCompilerCacheSession            : IntPtr
        CreateCompiler                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12CompilerFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @returns {D3D12_ADAPTER_FAMILY} 
     */
    EnumerateAdapterFamilies(AdapterFamilyIndex) {
        pAdapterFamily := D3D12_ADAPTER_FAMILY()
        result := ComCall(3, this, "uint", AdapterFamilyIndex, D3D12_ADAPTER_FAMILY.Ptr, pAdapterFamily, "HRESULT")
        return pAdapterFamily
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<Integer>} pNumABIVersions 
     * @returns {Integer} 
     */
    EnumerateAdapterFamilyABIVersions(AdapterFamilyIndex, pNumABIVersions) {
        pNumABIVersionsMarshal := pNumABIVersions is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", AdapterFamilyIndex, pNumABIVersionsMarshal, pNumABIVersions, "uint*", &pABIVersions := 0, "HRESULT")
        return pABIVersions
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @returns {D3D12_VERSION_NUMBER} 
     */
    EnumerateAdapterFamilyCompilerVersion(AdapterFamilyIndex) {
        pCompilerVersion := D3D12_VERSION_NUMBER()
        result := ComCall(5, this, "uint", AdapterFamilyIndex, D3D12_VERSION_NUMBER.Ptr, pCompilerVersion, "HRESULT")
        return pCompilerVersion
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @returns {D3D12_VERSION_NUMBER} 
     */
    GetApplicationProfileVersion(pTarget, pApplicationDesc) {
        pApplicationProfileVersion := D3D12_VERSION_NUMBER()
        result := ComCall(6, this, D3D12_COMPILER_TARGET.Ptr, pTarget, D3D12_APPLICATION_DESC.Ptr, pApplicationDesc, D3D12_VERSION_NUMBER.Ptr, pApplicationProfileVersion, "HRESULT")
        return pApplicationProfileVersion
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_DATABASE_PATH>} pPaths 
     * @param {Integer} NumPaths 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateCompilerCacheSession(pPaths, NumPaths, pTarget, pApplicationDesc, riid) {
        result := ComCall(7, this, D3D12_COMPILER_DATABASE_PATH.Ptr, pPaths, "uint", NumPaths, D3D12_COMPILER_TARGET.Ptr, pTarget, D3D12_APPLICATION_DESC.Ptr, pApplicationDesc, Guid.Ptr, riid, "ptr*", &ppCompilerCacheSession := 0, "HRESULT")
        return ppCompilerCacheSession
    }

    /**
     * 
     * @param {ID3D12CompilerCacheSession} pCompilerCacheSession 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateCompiler(pCompilerCacheSession, riid) {
        result := ComCall(8, this, "ptr", pCompilerCacheSession, Guid.Ptr, riid, "ptr*", &ppCompiler := 0, "HRESULT")
        return ppCompiler
    }

    Query(iid) {
        if (ID3D12CompilerFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateAdapterFamilies := CallbackCreate(GetMethod(implObj, "EnumerateAdapterFamilies"), flags, 3)
        this.vtbl.EnumerateAdapterFamilyABIVersions := CallbackCreate(GetMethod(implObj, "EnumerateAdapterFamilyABIVersions"), flags, 4)
        this.vtbl.EnumerateAdapterFamilyCompilerVersion := CallbackCreate(GetMethod(implObj, "EnumerateAdapterFamilyCompilerVersion"), flags, 3)
        this.vtbl.GetApplicationProfileVersion := CallbackCreate(GetMethod(implObj, "GetApplicationProfileVersion"), flags, 4)
        this.vtbl.CreateCompilerCacheSession := CallbackCreate(GetMethod(implObj, "CreateCompilerCacheSession"), flags, 7)
        this.vtbl.CreateCompiler := CallbackCreate(GetMethod(implObj, "CreateCompiler"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateAdapterFamilies)
        CallbackFree(this.vtbl.EnumerateAdapterFamilyABIVersions)
        CallbackFree(this.vtbl.EnumerateAdapterFamilyCompilerVersion)
        CallbackFree(this.vtbl.GetApplicationProfileVersion)
        CallbackFree(this.vtbl.CreateCompilerCacheSession)
        CallbackFree(this.vtbl.CreateCompiler)
    }
}
