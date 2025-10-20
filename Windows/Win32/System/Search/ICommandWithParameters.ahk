#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandWithParameters extends IUnknown{
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
     * @param {Pointer} cParamNames 
     * @param {Pointer<PWSTR>} rgParamNames 
     * @param {Pointer<IntPtr>} rgParamOrdinals 
     * @returns {HRESULT} 
     */
    MapParameterNames(cParamNames, rgParamNames, rgParamOrdinals) {
        result := ComCall(4, this, "ptr", cParamNames, "ptr", rgParamNames, "ptr*", rgParamOrdinals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cParams 
     * @param {Pointer<UIntPtr>} rgParamOrdinals 
     * @param {Pointer<DBPARAMBINDINFO>} rgParamBindInfo 
     * @returns {HRESULT} 
     */
    SetParameterInfo(cParams, rgParamOrdinals, rgParamBindInfo) {
        result := ComCall(5, this, "ptr", cParams, "ptr*", rgParamOrdinals, "ptr", rgParamBindInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
