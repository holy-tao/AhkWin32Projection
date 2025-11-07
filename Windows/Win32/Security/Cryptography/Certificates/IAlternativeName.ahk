#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Is used by an IX509ExtensionAlternativeNames object to represent an instance of an AlternativeNames extension.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ialternativename
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IAlternativeName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlternativeName
     * @type {Guid}
     */
    static IID => Guid("{728ab313-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromString", "InitializeFromRawData", "InitializeFromOtherName", "get_Type", "get_StrValue", "get_ObjectId", "get_RawData"]

    /**
     * 
     * @param {Integer} Type 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-initializefromstring
     */
    InitializeFromString(Type, strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(7, this, "int", Type, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Encoding 
     * @param {BSTR} strRawData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-initializefromrawdata
     */
    InitializeFromRawData(Type, Encoding, strRawData) {
        strRawData := strRawData is String ? BSTR.Alloc(strRawData).Value : strRawData

        result := ComCall(8, this, "int", Type, "int", Encoding, "ptr", strRawData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectId} pObjectId 
     * @param {Integer} Encoding 
     * @param {BSTR} strRawData 
     * @param {VARIANT_BOOL} ToBeWrapped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-initializefromothername
     */
    InitializeFromOtherName(pObjectId, Encoding, strRawData, ToBeWrapped) {
        strRawData := strRawData is String ? BSTR.Alloc(strRawData).Value : strRawData

        result := ComCall(9, this, "ptr", pObjectId, "int", Encoding, "ptr", strRawData, "short", ToBeWrapped, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-get_type
     */
    get_Type() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-get_strvalue
     */
    get_StrValue() {
        pValue := BSTR()
        result := ComCall(11, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-get_objectid
     */
    get_ObjectId() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ialternativename-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(13, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
