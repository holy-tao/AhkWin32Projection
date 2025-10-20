#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallingCard interface provides methods to retrieve information concerning telephony calling cards.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallingcard
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallingCard extends IDispatch{
    /**
     * The interface identifier for ITCallingCard
     * @type {Guid}
     */
    static IID => Guid("{0c4d8f00-8ddb-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCardID 
     * @returns {HRESULT} 
     */
    get_PermanentCardID(plCardID) {
        result := ComCall(7, this, "int*", plCardID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDigits 
     * @returns {HRESULT} 
     */
    get_NumberOfDigits(plDigits) {
        result := ComCall(8, this, "int*", plDigits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOptions 
     * @returns {HRESULT} 
     */
    get_Options(plOptions) {
        result := ComCall(9, this, "int*", plOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCardName 
     * @returns {HRESULT} 
     */
    get_CardName(ppCardName) {
        result := ComCall(10, this, "ptr", ppCardName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppRule 
     * @returns {HRESULT} 
     */
    get_SameAreaDialingRule(ppRule) {
        result := ComCall(11, this, "ptr", ppRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppRule 
     * @returns {HRESULT} 
     */
    get_LongDistanceDialingRule(ppRule) {
        result := ComCall(12, this, "ptr", ppRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppRule 
     * @returns {HRESULT} 
     */
    get_InternationalDialingRule(ppRule) {
        result := ComCall(13, this, "ptr", ppRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
