#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetAsynch extends IUnknown{
    /**
     * The interface identifier for IRowsetAsynch
     * @type {Guid}
     */
    static IID => Guid("{0c733a0f-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UIntPtr>} pulDenominator 
     * @param {Pointer<UIntPtr>} pulNumerator 
     * @param {Pointer<UIntPtr>} pcRows 
     * @param {Pointer<BOOL>} pfNewRows 
     * @returns {HRESULT} 
     */
    RatioFinished(pulDenominator, pulNumerator, pcRows, pfNewRows) {
        result := ComCall(3, this, "ptr*", pulDenominator, "ptr*", pulNumerator, "ptr*", pcRows, "ptr", pfNewRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
