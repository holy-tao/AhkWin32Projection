#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataWinMDImport extends IUnknown{
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
     * 
     * @param {Integer} tr 
     * @param {Pointer<UInt32>} ptkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @returns {HRESULT} 
     */
    GetUntransformedTypeRefProps(tr, ptkResolutionScope, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "uint", tr, "uint*", ptkResolutionScope, "ptr", szName, "uint", cchName, "uint*", pchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
