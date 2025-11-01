#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IAssemblyCache interface can be used to install, uninstall, or query a side-by-side assembly. An instance of IAssemblyCache is obtained by calling the CreateAssemblyCache function.
 * @see https://docs.microsoft.com/windows/win32/api//winsxs/nn-winsxs-iassemblycache
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IAssemblyCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAssemblyCache
     * @type {Guid}
     */
    static IID => Guid("{e707dcde-d1cd-11d2-bab9-00c04f8eceae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UninstallAssembly", "QueryAssemblyInfo", "CreateAssemblyCacheItem", "Reserved", "InstallAssembly"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszAssemblyName 
     * @param {Pointer<FUSION_INSTALL_REFERENCE>} pRefData 
     * @param {Pointer<Integer>} pulDisposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-uninstallassembly
     */
    UninstallAssembly(dwFlags, pszAssemblyName, pRefData, pulDisposition) {
        pszAssemblyName := pszAssemblyName is String ? StrPtr(pszAssemblyName) : pszAssemblyName

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszAssemblyName, "ptr", pRefData, "uint*", pulDisposition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszAssemblyName 
     * @param {Pointer<ASSEMBLY_INFO>} pAsmInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-queryassemblyinfo
     */
    QueryAssemblyInfo(dwFlags, pszAssemblyName, pAsmInfo) {
        pszAssemblyName := pszAssemblyName is String ? StrPtr(pszAssemblyName) : pszAssemblyName

        result := ComCall(4, this, "uint", dwFlags, "ptr", pszAssemblyName, "ptr", pAsmInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<IAssemblyCacheItem>} ppAsmItem 
     * @param {PWSTR} pszAssemblyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-createassemblycacheitem
     */
    CreateAssemblyCacheItem(dwFlags, pvReserved, ppAsmItem, pszAssemblyName) {
        pszAssemblyName := pszAssemblyName is String ? StrPtr(pszAssemblyName) : pszAssemblyName

        result := ComCall(5, this, "uint", dwFlags, "ptr", pvReserved, "ptr*", ppAsmItem, "ptr", pszAssemblyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    Reserved(ppUnk) {
        result := ComCall(6, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszManifestFilePath 
     * @param {Pointer<FUSION_INSTALL_REFERENCE>} pRefData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycache-installassembly
     */
    InstallAssembly(dwFlags, pszManifestFilePath, pRefData) {
        pszManifestFilePath := pszManifestFilePath is String ? StrPtr(pszManifestFilePath) : pszManifestFilePath

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszManifestFilePath, "ptr", pRefData, "HRESULT")
        return result
    }
}
