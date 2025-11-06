#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemPropertySet.ahk
#Include .\ISWbemObject.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObjectEx extends ISWbemObject{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Refresh_", "get_SystemProperties_", "GetText_", "SetFromText_"]

    /**
     * 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Refresh_(iFlags, objWbemNamedValueSet) {
        result := ComCall(32, this, "int", iFlags, "ptr", objWbemNamedValueSet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemPropertySet} 
     */
    get_SystemProperties_() {
        result := ComCall(33, this, "ptr*", &objWbemPropertySet := 0, "HRESULT")
        return ISWbemPropertySet(objWbemPropertySet)
    }

    /**
     * 
     * @param {Integer} iObjectTextFormat 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {BSTR} 
     */
    GetText_(iObjectTextFormat, iFlags, objWbemNamedValueSet) {
        bsText := BSTR()
        result := ComCall(34, this, "int", iObjectTextFormat, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", bsText, "HRESULT")
        return bsText
    }

    /**
     * 
     * @param {BSTR} bsText 
     * @param {Integer} iObjectTextFormat 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    SetFromText_(bsText, iObjectTextFormat, iFlags, objWbemNamedValueSet) {
        bsText := bsText is String ? BSTR.Alloc(bsText).Value : bsText

        result := ComCall(35, this, "ptr", bsText, "int", iObjectTextFormat, "int", iFlags, "ptr", objWbemNamedValueSet, "HRESULT")
        return result
    }
}
