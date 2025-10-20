#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugFormatter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugFormatter
     * @type {Guid}
     */
    static IID => Guid("{51973c05-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringForVariant", "GetVariantForString", "GetStringForVarType"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {Integer} nRadix 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    GetStringForVariant(pvar, nRadix, pbstrValue) {
        result := ComCall(3, this, "ptr", pvar, "uint", nRadix, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrValue 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    GetVariantForString(pwstrValue, pvar) {
        pwstrValue := pwstrValue is String ? StrPtr(pwstrValue) : pwstrValue

        result := ComCall(4, this, "ptr", pwstrValue, "ptr", pvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vt 
     * @param {Pointer<TYPEDESC>} ptdescArrayType 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetStringForVarType(vt, ptdescArrayType, pbstr) {
        result := ComCall(5, this, "ushort", vt, "ptr", ptdescArrayType, "ptr", pbstr, "HRESULT")
        return result
    }
}
