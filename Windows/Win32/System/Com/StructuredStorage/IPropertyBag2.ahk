#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertyBag2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyBag2
     * @type {Guid}
     */
    static IID => Guid("{22f55882-280b-11d0-a8a9-00a0c90c2004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write", "CountProperties", "GetPropertyInfo", "LoadObject"]

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {IErrorLog} pErrLog 
     * @param {Pointer<HRESULT>} phrError 
     * @returns {VARIANT} 
     */
    Read(cProperties, pPropBag, pErrLog, phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        pvarValue := VARIANT()
        result := ComCall(3, this, "uint", cProperties, "ptr", pPropBag, "ptr", pErrLog, "ptr", pvarValue, phrErrorMarshal, phrError, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    Write(cProperties, pPropBag, pvarValue) {
        result := ComCall(4, this, "uint", cProperties, "ptr", pPropBag, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    CountProperties() {
        result := ComCall(5, this, "uint*", &pcProperties := 0, "HRESULT")
        return pcProperties
    }

    /**
     * 
     * @param {Integer} iProperty 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<Integer>} pcProperties 
     * @returns {HRESULT} 
     */
    GetPropertyInfo(iProperty, cProperties, pPropBag, pcProperties) {
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iProperty, "uint", cProperties, "ptr", pPropBag, pcPropertiesMarshal, pcProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwHint 
     * @param {IUnknown} pUnkObject 
     * @param {IErrorLog} pErrLog 
     * @returns {HRESULT} 
     */
    LoadObject(pstrName, dwHint, pUnkObject, pErrLog) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(7, this, "ptr", pstrName, "uint", dwHint, "ptr", pUnkObject, "ptr", pErrLog, "HRESULT")
        return result
    }
}
