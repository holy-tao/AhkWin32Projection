#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Is used by an IX509ExtensionAlternativeNames object to represent an instance of an AlternativeNames extension.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ialternativename
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IAlternativeName extends IDispatch{
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
     * 
     * @param {Integer} Type 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    InitializeFromString(Type, strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(7, this, "int", Type, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Encoding 
     * @param {BSTR} strRawData 
     * @returns {HRESULT} 
     */
    InitializeFromRawData(Type, Encoding, strRawData) {
        strRawData := strRawData is String ? BSTR.Alloc(strRawData).Value : strRawData

        result := ComCall(8, this, "int", Type, "int", Encoding, "ptr", strRawData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} pObjectId 
     * @param {Integer} Encoding 
     * @param {BSTR} strRawData 
     * @param {VARIANT_BOOL} ToBeWrapped 
     * @returns {HRESULT} 
     */
    InitializeFromOtherName(pObjectId, Encoding, strRawData, ToBeWrapped) {
        strRawData := strRawData is String ? BSTR.Alloc(strRawData).Value : strRawData

        result := ComCall(9, this, "ptr", pObjectId, "int", Encoding, "ptr", strRawData, "short", ToBeWrapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_Type(pValue) {
        result := ComCall(10, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_StrValue(pValue) {
        result := ComCall(11, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_ObjectId(ppValue) {
        result := ComCall(12, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_RawData(Encoding, pValue) {
        result := ComCall(13, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
