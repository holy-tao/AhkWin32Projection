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
     * Sets the specified option to a given value for the current metadata scope. The option controls how calls to the current metadata scope are handled.
     * @param {Pointer<Guid>} optionid 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenserex-setoption
     */
    SetOption(optionid, value) {
        result := ComCall(6, this, "ptr", optionid, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets the value of the specified option for the current metadata scope. The option controls how calls to the current metadata scope are handled.
     * @param {Pointer<Guid>} optionid 
     * @param {Pointer<VARIANT>} pvalue 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenserex-getoption
     */
    GetOption(optionid, pvalue) {
        result := ComCall(7, this, "ptr", optionid, "ptr", pvalue, "HRESULT")
        return result
    }

    /**
     * Opens the specified scope type.
     * @param {ITypeInfo} pITI Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> interface that provides the type information on which to open the scope.
     * @param {Integer} dwOpenFlags The open mode flags.
     * @param {Pointer<Guid>} riid The desired interface.
     * @returns {IUnknown} Pointer to a pointer to the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenserex-openscopeonitypeinfo
     */
    OpenScopeOnITypeInfo(pITI, dwOpenFlags, riid) {
        result := ComCall(8, this, "ptr", pITI, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * Gets the directory that holds the current common language runtime (CLR). This method is supported only for use by out-of-process debuggers. If called from another component, it will return E_NOTIMPL.
     * @param {PWSTR} szBuffer The buffer to receive the directory name.
     * @param {Integer} cchBuffer The size, in bytes, of <i>szBuffer</i>.
     * @param {Pointer<Integer>} pchBuffer The number of bytes actually returned in <i>szBuffer</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenserex-getcorsystemdirectory
     */
    GetCORSystemDirectory(szBuffer, cchBuffer, pchBuffer) {
        szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

        pchBufferMarshal := pchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", szBuffer, "uint", cchBuffer, pchBufferMarshal, pchBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the name of the assembly.
     * @param {PWSTR} szAppBase Not used.
     * @param {PWSTR} szPrivateBin Not used.
     * @param {PWSTR} szGlobalBin Not used.
     * @param {PWSTR} szAssemblyName The name of the assembly to find.
     * @param {PWSTR} szName The simple name of the assembly.
     * @param {Integer} cchName The size, in bytes, of <i>szName</i>.
     * @param {Pointer<Integer>} pcName 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenserex-findassembly
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
     * Finds the name of the assembly module.
     * @param {PWSTR} szAppBase Not used.
     * @param {PWSTR} szPrivateBin Not used.
     * @param {PWSTR} szGlobalBin Not used.
     * @param {PWSTR} szAssemblyName The assembly to be found.
     * @param {PWSTR} szModuleName The name of the module.
     * @param {PWSTR} szName The simple name of the assembly.
     * @param {Integer} cchName The size, in bytes, of <i>szName</i>.
     * @param {Pointer<Integer>} pcName The number of characters actually returned in <i>szName</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenserex-findassemblymodule
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
