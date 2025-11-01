#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICryptAttributes interface contains methods and properties that enable you to manage a collection of ICryptAttribute objects.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icryptattributes
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICryptAttributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICryptAttributes
     * @type {Guid}
     */
    static IID => Guid("{728ab32d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "get_IndexByObjectId", "AddRange"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ICryptAttribute>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-get_itembyindex
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-get_count
     */
    get_Count(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICryptAttribute} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectId} pObjectId 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-get_indexbyobjectid
     */
    get_IndexByObjectId(pObjectId, pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "ptr", pObjectId, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICryptAttributes} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icryptattributes-addrange
     */
    AddRange(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }
}
