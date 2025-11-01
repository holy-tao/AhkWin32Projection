#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandWithParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandWithParameters
     * @type {Guid}
     */
    static IID => Guid("{0c733a64-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameterInfo", "MapParameterNames", "SetParameterInfo"]

    /**
     * 
     * @param {Pointer<Pointer>} pcParams 
     * @param {Pointer<Pointer<DBPARAMINFO>>} prgParamInfo 
     * @param {Pointer<Pointer<Integer>>} ppNamesBuffer 
     * @returns {HRESULT} 
     */
    GetParameterInfo(pcParams, prgParamInfo, ppNamesBuffer) {
        result := ComCall(3, this, "ptr*", pcParams, "ptr*", prgParamInfo, "ptr*", ppNamesBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cParamNames 
     * @param {Pointer<PWSTR>} rgParamNames 
     * @param {Pointer<Pointer>} rgParamOrdinals 
     * @returns {HRESULT} 
     */
    MapParameterNames(cParamNames, rgParamNames, rgParamOrdinals) {
        result := ComCall(4, this, "ptr", cParamNames, "ptr", rgParamNames, "ptr*", rgParamOrdinals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cParams 
     * @param {Pointer<Pointer>} rgParamOrdinals 
     * @param {Pointer<DBPARAMBINDINFO>} rgParamBindInfo 
     * @returns {HRESULT} 
     */
    SetParameterInfo(cParams, rgParamOrdinals, rgParamBindInfo) {
        result := ComCall(5, this, "ptr", cParams, "ptr*", rgParamOrdinals, "ptr", rgParamBindInfo, "HRESULT")
        return result
    }
}
