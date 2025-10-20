#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintCoreHelper.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreHelperPS extends IPrintCoreHelper{
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
     * 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<UInt32>} pdwDataType 
     * @param {Pointer<Byte>} ppbData 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetGlobalAttribute(pszAttribute, pdwDataType, ppbData, pcbSize) {
        result := ComCall(12, this, "ptr", pszAttribute, "uint*", pdwDataType, "char*", ppbData, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<UInt32>} pdwDataType 
     * @param {Pointer<Byte>} ppbData 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetFeatureAttribute(pszFeatureKeyword, pszAttribute, pdwDataType, ppbData, pcbSize) {
        result := ComCall(13, this, "ptr", pszFeatureKeyword, "ptr", pszAttribute, "uint*", pdwDataType, "char*", ppbData, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<UInt32>} pdwDataType 
     * @param {Pointer<Byte>} ppbData 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetOptionAttribute(pszFeatureKeyword, pszOptionKeyword, pszAttribute, pdwDataType, ppbData, pcbSize) {
        result := ComCall(14, this, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", pszAttribute, "uint*", pdwDataType, "char*", ppbData, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
