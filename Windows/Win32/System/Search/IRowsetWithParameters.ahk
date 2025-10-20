#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetWithParameters extends IUnknown{
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
     * 
     * @param {Pointer<UIntPtr>} pcParams 
     * @param {Pointer<DBPARAMINFO>} prgParamInfo 
     * @param {Pointer<UInt16>} ppNamesBuffer 
     * @returns {HRESULT} 
     */
    GetParameterInfo(pcParams, prgParamInfo, ppNamesBuffer) {
        result := ComCall(3, this, "ptr*", pcParams, "ptr", prgParamInfo, "ushort*", ppNamesBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<UInt32>} pulErrorParam 
     * @param {Pointer<UIntPtr>} phReserved 
     * @returns {HRESULT} 
     */
    Requery(pParams, pulErrorParam, phReserved) {
        result := ComCall(4, this, "ptr", pParams, "uint*", pulErrorParam, "ptr*", phReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
