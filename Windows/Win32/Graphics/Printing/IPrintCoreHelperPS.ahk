#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintCoreHelper.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreHelperPS extends IPrintCoreHelper{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCoreHelperPS
     * @type {Guid}
     */
    static IID => Guid("{c2c14f6f-95d3-4d63-96cf-6bd9e6c907c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGlobalAttribute", "GetFeatureAttribute", "GetOptionAttribute"]

    /**
     * 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetGlobalAttribute(pszAttribute, pdwDataType, ppbData, pcbSize) {
        result := ComCall(12, this, "ptr", pszAttribute, "uint*", pdwDataType, "ptr*", ppbData, "uint*", pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetFeatureAttribute(pszFeatureKeyword, pszAttribute, pdwDataType, ppbData, pcbSize) {
        result := ComCall(13, this, "ptr", pszFeatureKeyword, "ptr", pszAttribute, "uint*", pdwDataType, "ptr*", ppbData, "uint*", pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetOptionAttribute(pszFeatureKeyword, pszOptionKeyword, pszAttribute, pdwDataType, ppbData, pcbSize) {
        result := ComCall(14, this, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", pszAttribute, "uint*", pdwDataType, "ptr*", ppbData, "uint*", pcbSize, "HRESULT")
        return result
    }
}
