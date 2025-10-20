#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509CertificateTemplates interface defines the following methods and properties that manage a collection of IX509CertificateTemplate objects.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificatetemplates
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateTemplates extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateTemplates
     * @type {Guid}
     */
    static IID => Guid("{13b79003-2181-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "get_ItemByName", "get_ItemByOid"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IX509CertificateTemplate>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-get_itembyindex
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-get_count
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509CertificateTemplate} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IX509CertificateTemplate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-get_itembyname
     */
    get_ItemByName(bstrName, ppValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "ptr", bstrName, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectId} pOid 
     * @param {Pointer<IX509CertificateTemplate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplates-get_itembyoid
     */
    get_ItemByOid(pOid, ppValue) {
        result := ComCall(14, this, "ptr", pOid, "ptr*", ppValue, "HRESULT")
        return result
    }
}
