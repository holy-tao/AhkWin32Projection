#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXAttributes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXAttributes
     * @type {Guid}
     */
    static IID => Guid("{f078abe1-45d2-4832-91ea-4466ce2f25c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getLength", "getURI", "getLocalName", "getQName", "getName", "getIndexFromName", "getIndexFromQName", "getType", "getTypeFromName", "getTypeFromQName", "getValue", "getValueFromName", "getValueFromQName"]

    /**
     * 
     * @param {Pointer<Integer>} pnLength 
     * @returns {HRESULT} 
     */
    getLength(pnLength) {
        pnLengthMarshal := pnLength is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pnLengthMarshal, pnLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchUri 
     * @param {Pointer<Integer>} pcchUri 
     * @returns {HRESULT} 
     */
    getURI(nIndex, ppwchUri, pcchUri) {
        pcchUriMarshal := pcchUri is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", nIndex, "ptr*", ppwchUri, pcchUriMarshal, pcchUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchLocalName 
     * @param {Pointer<Integer>} pcchLocalName 
     * @returns {HRESULT} 
     */
    getLocalName(nIndex, ppwchLocalName, pcchLocalName) {
        pcchLocalNameMarshal := pcchLocalName is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", nIndex, "ptr*", ppwchLocalName, pcchLocalNameMarshal, pcchLocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchQName 
     * @param {Pointer<Integer>} pcchQName 
     * @returns {HRESULT} 
     */
    getQName(nIndex, ppwchQName, pcchQName) {
        pcchQNameMarshal := pcchQName is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", nIndex, "ptr*", ppwchQName, pcchQNameMarshal, pcchQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchUri 
     * @param {Pointer<Integer>} pcchUri 
     * @param {Pointer<Pointer<Integer>>} ppwchLocalName 
     * @param {Pointer<Integer>} pcchLocalName 
     * @param {Pointer<Pointer<Integer>>} ppwchQName 
     * @param {Pointer<Integer>} pcchQName 
     * @returns {HRESULT} 
     */
    getName(nIndex, ppwchUri, pcchUri, ppwchLocalName, pcchLocalName, ppwchQName, pcchQName) {
        pcchUriMarshal := pcchUri is VarRef ? "int*" : "ptr"
        pcchLocalNameMarshal := pcchLocalName is VarRef ? "int*" : "ptr"
        pcchQNameMarshal := pcchQName is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", nIndex, "ptr*", ppwchUri, pcchUriMarshal, pcchUri, "ptr*", ppwchLocalName, pcchLocalNameMarshal, pcchLocalName, "ptr*", ppwchQName, pcchQNameMarshal, pcchQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<Integer>} pnIndex 
     * @returns {HRESULT} 
     */
    getIndexFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, pnIndex) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        pnIndexMarshal := pnIndex is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, pnIndexMarshal, pnIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<Integer>} pnIndex 
     * @returns {HRESULT} 
     */
    getIndexFromQName(pwchQName, cchQName, pnIndex) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        pnIndexMarshal := pnIndex is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", pwchQName, "int", cchQName, pnIndexMarshal, pnIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchType 
     * @param {Pointer<Integer>} pcchType 
     * @returns {HRESULT} 
     */
    getType(nIndex, ppwchType, pcchType) {
        pcchTypeMarshal := pcchType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", nIndex, "ptr*", ppwchType, pcchTypeMarshal, pcchType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<Pointer<Integer>>} ppwchType 
     * @param {Pointer<Integer>} pcchType 
     * @returns {HRESULT} 
     */
    getTypeFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, ppwchType, pcchType) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        pcchTypeMarshal := pcchType is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, "ptr*", ppwchType, pcchTypeMarshal, pcchType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<Pointer<Integer>>} ppwchType 
     * @param {Pointer<Integer>} pcchType 
     * @returns {HRESULT} 
     */
    getTypeFromQName(pwchQName, cchQName, ppwchType, pcchType) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        pcchTypeMarshal := pcchType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pwchQName, "int", cchQName, "ptr*", ppwchType, pcchTypeMarshal, pcchType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     */
    getValue(nIndex, ppwchValue, pcchValue) {
        pcchValueMarshal := pcchValue is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "int", nIndex, "ptr*", ppwchValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<Pointer<Integer>>} ppwchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     */
    getValueFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, ppwchValue, pcchValue) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        pcchValueMarshal := pcchValue is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, "ptr*", ppwchValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<Pointer<Integer>>} ppwchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     */
    getValueFromQName(pwchQName, cchQName, ppwchValue, pcchValue) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        pcchValueMarshal := pcchValue is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", pwchQName, "int", cchQName, "ptr*", ppwchValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }
}
