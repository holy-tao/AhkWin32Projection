#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataWinMDImport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataWinMDImport
     * @type {Guid}
     */
    static IID => Guid("{969ea0c5-964e-411b-a807-b0f3c2dfcbd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUntransformedTypeRefProps"]

    /**
     * 
     * @param {Integer} tr 
     * @param {Pointer<Integer>} ptkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @returns {HRESULT} 
     */
    GetUntransformedTypeRefProps(tr, ptkResolutionScope, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkResolutionScopeMarshal := ptkResolutionScope is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", tr, ptkResolutionScopeMarshal, ptkResolutionScope, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }
}
