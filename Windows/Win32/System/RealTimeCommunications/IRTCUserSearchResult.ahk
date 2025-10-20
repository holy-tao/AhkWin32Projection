#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCUserSearchResult extends IUnknown{
    /**
     * The interface identifier for IRTCUserSearchResult
     * @type {Guid}
     */
    static IID => Guid("{851278b2-9592-480f-8db5-2de86b26b54d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} enColumn 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    get_Value(enColumn, pbstrValue) {
        result := ComCall(3, this, "int", enColumn, "ptr", pbstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
