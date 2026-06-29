#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ASSEMBLY_INFO.ahk" { ASSEMBLY_INFO }
#Import ".\IAssemblyCacheItem.ahk" { IAssemblyCacheItem }
#Import ".\IASSEMBLYCACHE_UNINSTALL_DISPOSITION.ahk" { IASSEMBLYCACHE_UNINSTALL_DISPOSITION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FUSION_INSTALL_REFERENCE.ahk" { FUSION_INSTALL_REFERENCE }
#Import ".\QUERYASMINFO_FLAGS.ahk" { QUERYASMINFO_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAssemblyCache interface can be used to install, uninstall, or query a side-by-side assembly. An instance of IAssemblyCache is obtained by calling the CreateAssemblyCache function.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/nn-winsxs-iassemblycache
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IAssemblyCache extends IUnknown {
    /**
     * The interface identifier for IAssemblyCache
     * @type {Guid}
     */
    static IID := Guid("{e707dcde-d1cd-11d2-bab9-00c04f8eceae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAssemblyCache interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UninstallAssembly       : IntPtr
        QueryAssemblyInfo       : IntPtr
        CreateAssemblyCacheItem : IntPtr
        Reserved                : IntPtr
        InstallAssembly         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAssemblyCache.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The UnistallAssembly method removes an application reference to an assembly from the side-by-side store.
     * @param {Integer} dwFlags This parameter must be 0.
     * @param {PWSTR} pszAssemblyName A pointer to a null-terminated string value that contains the fully-specified strong name of the assembly. If the full name is not provided, the result is undefined.
     * @param {Pointer<FUSION_INSTALL_REFERENCE>} pRefData A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ns-winsxs-fusion_install_reference">FUSION_INSTALL_REFERENCE</a> structure that describes the application that holds the reference to the assembly being removed. If this value is null, no  references to the assembly by applications  are left in the side-by-side store and the assembly's files are removed.
     * 
     * <div class="alert"><b>Note</b>  The characters \, /, :, ;, *, &lt;, &gt;, and | are invalid in the reference ID.</div>
     * <div> </div>
     * @param {Pointer<IASSEMBLYCACHE_UNINSTALL_DISPOSITION>} pulDisposition A pointer to an integer value that describes the action performed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The files of the assembly have been removed from the side-by-side store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded and the reference to the assembly was removed. The assembly files were not removed from the side-by-side store for the reason described by the value returned by <i>pulDisposition</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-uninstallassembly
     */
    UninstallAssembly(dwFlags, pszAssemblyName, pRefData, pulDisposition) {
        pszAssemblyName := pszAssemblyName is String ? StrPtr(pszAssemblyName) : pszAssemblyName

        pulDispositionMarshal := pulDisposition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszAssemblyName, FUSION_INSTALL_REFERENCE.Ptr, pRefData, pulDispositionMarshal, pulDisposition, "HRESULT")
        return result
    }

    /**
     * The QueryAssemblyInfo method queries the side-by-side assembly store for assembly information and validates the files in the side-by-side assembly store against the assembly manifest.
     * @param {QUERYASMINFO_FLAGS} dwFlags Specifies the information to retrieve.
     * @param {PWSTR} pszAssemblyName Pointer to null-terminated string value containing the fully-specified strong name of the assembly to query. If the name is not fully specified, the result of the method is undefined.
     * @param {Pointer<ASSEMBLY_INFO>} pAsmInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/ns-winsxs-assembly_info">ASSEMBLY_INFO</a> structure that receives the information.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-queryassemblyinfo
     */
    QueryAssemblyInfo(dwFlags, pszAssemblyName, pAsmInfo) {
        pszAssemblyName := pszAssemblyName is String ? StrPtr(pszAssemblyName) : pszAssemblyName

        result := ComCall(4, this, QUERYASMINFO_FLAGS, dwFlags, "ptr", pszAssemblyName, ASSEMBLY_INFO.Ptr, pAsmInfo, "HRESULT")
        return result
    }

    /**
     * The CreateAssemblyCacheItem method creates an item in the assembly cache that corresponds to the side-by-side assembly being installed.
     * @param {Integer} dwFlags Reserved.
     * @param {Pointer<Void>} pvReserved Reserved.
     * @param {PWSTR} pszAssemblyName Pointer to a null-terminated string value containing the fully-specified strong name of the assembly that is being installed. The name provided is verified to match the name of the assembly in the manifest. Partial names return <b>FUSION_E_INVALID_NAME</b>. If this parameter is null, the name is not verified.
     * @returns {IAssemblyCacheItem} Pointer to a location containing the pointer to the instance of the <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nn-winsxs-iassemblycacheitem">IAssemblyCacheItem</a> that receives the information.
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-createassemblycacheitem
     */
    CreateAssemblyCacheItem(dwFlags, pvReserved, pszAssemblyName) {
        pszAssemblyName := pszAssemblyName is String ? StrPtr(pszAssemblyName) : pszAssemblyName

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", dwFlags, pvReservedMarshal, pvReserved, "ptr*", &ppAsmItem := 0, "ptr", pszAssemblyName, "HRESULT")
        return IAssemblyCacheItem(ppAsmItem)
    }

    /**
     * The following words are reserved for use by the HLSL language. Do not use them to name variables or functions in your HLSL code.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-appendix-reserved-words
     */
    Reserved() {
        result := ComCall(6, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The InstallAssembly method adds an application reference to an assembly to the side-by-side store and copies the files of the assembly to the side-by-side store. The files of the assembly being installed must be present in the current file system.
     * @param {Integer} dwFlags This parameter specifies how existing files in the side-by-side store are to replaced by files in the assembly being installed.
     * 
     * 
     * One of the following options can be specified.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHE_INSTALL_FLAG_REFRESH"></a><a id="iassemblycache_install_flag_refresh"></a><dl>
     * <dt><b>IASSEMBLYCACHE_INSTALL_FLAG_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace existing files in the side-by-side store with the files in the assembly being installed if the version of the file in the assembly is greater than or equal to the version of the existing file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IASSEMBLYCACHE_INSTALL_FLAG_FORCE_REFRESH"></a><a id="iassemblycache_install_flag_force_refresh"></a><dl>
     * <dt><b>IASSEMBLYCACHE_INSTALL_FLAG_FORCE_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replace existing files in the side-by-side store with the files in the assembly being installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pszManifestFilePath A pointer to a string value that contains the full path to the dynamic-linked library (DLL) or executable (EXE) file that contains the assembly manifest. Any other assembly files must be located in the same directory as this DLL or EXE.
     * @param {Pointer<FUSION_INSTALL_REFERENCE>} pRefData A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ns-winsxs-fusion_install_reference">FUSION_INSTALL_REFERENCE</a> structure that describes the application that holds the reference to the assembly being installed. If this parameter is null, the assembly files are copied, but no application reference is added to the side-by-side store.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-installassembly
     */
    InstallAssembly(dwFlags, pszManifestFilePath, pRefData) {
        pszManifestFilePath := pszManifestFilePath is String ? StrPtr(pszManifestFilePath) : pszManifestFilePath

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszManifestFilePath, FUSION_INSTALL_REFERENCE.Ptr, pRefData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAssemblyCache.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UninstallAssembly := CallbackCreate(GetMethod(implObj, "UninstallAssembly"), flags, 5)
        this.vtbl.QueryAssemblyInfo := CallbackCreate(GetMethod(implObj, "QueryAssemblyInfo"), flags, 4)
        this.vtbl.CreateAssemblyCacheItem := CallbackCreate(GetMethod(implObj, "CreateAssemblyCacheItem"), flags, 5)
        this.vtbl.Reserved := CallbackCreate(GetMethod(implObj, "Reserved"), flags, 2)
        this.vtbl.InstallAssembly := CallbackCreate(GetMethod(implObj, "InstallAssembly"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UninstallAssembly)
        CallbackFree(this.vtbl.QueryAssemblyInfo)
        CallbackFree(this.vtbl.CreateAssemblyCacheItem)
        CallbackFree(this.vtbl.Reserved)
        CallbackFree(this.vtbl.InstallAssembly)
    }
}
