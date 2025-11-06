#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk
#Include .\IMetaDataDispenser.ahk

/**
 * Extends the IMetaDataDispenser interface to provide the capability to control how the metadata APIs operate on the current metadata scope.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadatadispenserex
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataDispenserEx extends IMetaDataDispenser{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataDispenserEx
     * @type {Guid}
     */
    static IID => Guid("{31bcfce2-dafb-11d2-9f81-00c04f79a0a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOption", "GetOption", "OpenScopeOnITypeInfo", "GetCORSystemDirectory", "FindAssembly", "FindAssemblyModule"]

    /**
     * 
     * @param {Pointer<Guid>} optionid 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-setoption
     */
    SetOption(optionid, value) {
        result := ComCall(6, this, "ptr", optionid, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} optionid 
     * @param {Pointer<VARIANT>} pvalue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-getoption
     */
    GetOption(optionid, pvalue) {
        result := ComCall(7, this, "ptr", optionid, "ptr", pvalue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITypeInfo} pITI 
     * @param {Integer} dwOpenFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-openscopeonitypeinfo
     */
    OpenScopeOnITypeInfo(pITI, dwOpenFlags, riid) {
        result := ComCall(8, this, "ptr", pITI, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * 
     * @param {PWSTR} szBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} pchBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-getcorsystemdirectory
     */
    GetCORSystemDirectory(szBuffer, cchBuffer, pchBuffer) {
        szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

        pchBufferMarshal := pchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", szBuffer, "uint", cchBuffer, pchBufferMarshal, pchBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szAppBase 
     * @param {PWSTR} szPrivateBin 
     * @param {PWSTR} szGlobalBin 
     * @param {PWSTR} szAssemblyName 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-findassembly
     */
    FindAssembly(szAppBase, szPrivateBin, szGlobalBin, szAssemblyName, szName, cchName, pcName) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szGlobalBin := szGlobalBin is String ? StrPtr(szGlobalBin) : szGlobalBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName
        szName := szName is String ? StrPtr(szName) : szName

        pcNameMarshal := pcName is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szGlobalBin, "ptr", szAssemblyName, "ptr", szName, "uint", cchName, pcNameMarshal, pcName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szAppBase 
     * @param {PWSTR} szPrivateBin 
     * @param {PWSTR} szGlobalBin 
     * @param {PWSTR} szAssemblyName 
     * @param {PWSTR} szModuleName 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-findassemblymodule
     */
    FindAssemblyModule(szAppBase, szPrivateBin, szGlobalBin, szAssemblyName, szModuleName, szName, cchName, pcName) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szGlobalBin := szGlobalBin is String ? StrPtr(szGlobalBin) : szGlobalBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName
        szModuleName := szModuleName is String ? StrPtr(szModuleName) : szModuleName
        szName := szName is String ? StrPtr(szName) : szName

        pcNameMarshal := pcName is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szGlobalBin, "ptr", szAssemblyName, "ptr", szModuleName, "ptr", szName, "uint", cchName, pcNameMarshal, pcName, "HRESULT")
        return result
    }
}
