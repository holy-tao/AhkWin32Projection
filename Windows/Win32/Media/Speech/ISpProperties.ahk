#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpProperties
     * @type {Guid}
     */
    static IID => Guid("{5b4fb971-b115-4de1-ad97-e482e3bf6ee4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPropertyNum", "GetPropertyNum", "SetPropertyString", "GetPropertyString"]

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    SetPropertyNum(pName, lValue) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pName, "int", lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<Integer>} plValue 
     * @returns {HRESULT} 
     */
    GetPropertyNum(pName, plValue) {
        pName := pName is String ? StrPtr(pName) : pName

        plValueMarshal := plValue is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pName, plValueMarshal, plValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pValue 
     * @returns {HRESULT} 
     */
    SetPropertyString(pName, pValue) {
        pName := pName is String ? StrPtr(pName) : pName
        pValue := pValue is String ? StrPtr(pValue) : pValue

        result := ComCall(5, this, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {PWSTR} 
     */
    GetPropertyString(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(6, this, "ptr", pName, "ptr*", &ppCoMemValue := 0, "HRESULT")
        return ppCoMemValue
    }
}
