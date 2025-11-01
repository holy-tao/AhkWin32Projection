#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetWithParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetWithParameters
     * @type {Guid}
     */
    static IID => Guid("{0c733a6e-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameterInfo", "Requery"]

    /**
     * 
     * @param {Pointer<Pointer>} pcParams 
     * @param {Pointer<Pointer<DBPARAMINFO>>} prgParamInfo 
     * @param {Pointer<Pointer<Integer>>} ppNamesBuffer 
     * @returns {HRESULT} 
     */
    GetParameterInfo(pcParams, prgParamInfo, ppNamesBuffer) {
        pcParamsMarshal := pcParams is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcParamsMarshal, pcParams, "ptr*", prgParamInfo, "ptr*", ppNamesBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Integer>} pulErrorParam 
     * @param {Pointer<Pointer>} phReserved 
     * @returns {HRESULT} 
     */
    Requery(pParams, pulErrorParam, phReserved) {
        pulErrorParamMarshal := pulErrorParam is VarRef ? "uint*" : "ptr"
        phReservedMarshal := phReserved is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pParams, pulErrorParamMarshal, pulErrorParam, phReservedMarshal, phReserved, "HRESULT")
        return result
    }
}
