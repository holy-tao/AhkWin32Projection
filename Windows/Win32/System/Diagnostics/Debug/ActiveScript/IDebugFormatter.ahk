#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\TYPEDESC.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include ..\..\..\Variant\VARENUM.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IDebugFormatter extends IUnknown {

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
     * @returns {BSTR} 
     */
    GetStringForVariant(pvar, nRadix) {
        pbstrValue := BSTR({Value: 0}, True)
        result := ComCall(3, this, "ptr", pvar, "uint", nRadix, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @param {PWSTR} pwstrValue 
     * @returns {VARIANT} 
     */
    GetVariantForString(pwstrValue) {
        pwstrValue := pwstrValue is String ? StrPtr(pwstrValue) : pwstrValue

        pvar := VARIANT()
        result := ComCall(4, this, "ptr", pwstrValue, "ptr", pvar, "HRESULT")
        return pvar
    }

    /**
     * 
     * @param {VARENUM} vt 
     * @param {Pointer<TYPEDESC>} ptdescArrayType 
     * @returns {BSTR} 
     */
    GetStringForVarType(vt, ptdescArrayType) {
        pbstr := BSTR({Value: 0}, True)
        result := ComCall(5, this, "ushort", vt, "ptr", ptdescArrayType, "ptr", pbstr, "HRESULT")
        return pbstr
    }
}
