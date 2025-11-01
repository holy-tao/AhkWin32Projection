#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICertificationAuthorities interface defines the following methods and properties that manage a collection of ICertificationAuthority objects.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertificationauthorities
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertificationAuthorities extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificationAuthorities
     * @type {Guid}
     */
    static IID => Guid("{13b79005-2181-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "ComputeSiteCosts", "get_ItemByName"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ICertificationAuthority>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get_itembyindex
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get_count
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICertificationAuthority} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-computesitecosts
     */
    ComputeSiteCosts() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<ICertificationAuthority>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get_itembyname
     */
    get_ItemByName(strName, ppValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "ptr", strName, "ptr*", ppValue, "HRESULT")
        return result
    }
}
