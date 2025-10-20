#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemObject.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObjectEx extends ISWbemObject{
    /**
     * The interface identifier for ISWbemObjectEx
     * @type {Guid}
     */
    static IID => Guid("{269ad56a-8a67-4129-bc8c-0506dcfe9880}")

    /**
     * The class identifier for SWbemObjectEx
     * @type {Guid}
     */
    static CLSID => Guid("{d6bdafb2-9435-491f-bb87-6aa0f0bc31a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Refresh_(iFlags, objWbemNamedValueSet) {
        result := ComCall(32, this, "int", iFlags, "ptr", objWbemNamedValueSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemPropertySet>} objWbemPropertySet 
     * @returns {HRESULT} 
     */
    get_SystemProperties_(objWbemPropertySet) {
        result := ComCall(33, this, "ptr", objWbemPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iObjectTextFormat 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<BSTR>} bsText 
     * @returns {HRESULT} 
     */
    GetText_(iObjectTextFormat, iFlags, objWbemNamedValueSet, bsText) {
        result := ComCall(34, this, "int", iObjectTextFormat, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", bsText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bsText 
     * @param {Integer} iObjectTextFormat 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    SetFromText_(bsText, iObjectTextFormat, iFlags, objWbemNamedValueSet) {
        bsText := bsText is String ? BSTR.Alloc(bsText).Value : bsText

        result := ComCall(35, this, "ptr", bsText, "int", iObjectTextFormat, "int", iFlags, "ptr", objWbemNamedValueSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
