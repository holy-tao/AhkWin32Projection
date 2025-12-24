#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateTemplate.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves an IX509CertificateTemplate object from the collection by index number.
     * @param {Integer} Index 
     * @returns {IX509CertificateTemplate} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return IX509CertificateTemplate(pVal)
    }

    /**
     * Retrieves the number of IX509CertificateTemplate objects in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the enumerator for the collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Adds an IX509CertificateTemplate object to the collection.
     * @param {IX509CertificateTemplate} pVal Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> object to add to the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Removes an IX509CertificateTemplate object from the collection by index number.
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * Removes all IX509CertificateTemplate objects from the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an IX509CertificateTemplate object from the collection by name.
     * @param {BSTR} bstrName 
     * @returns {IX509CertificateTemplate} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-get_itembyname
     */
    get_ItemByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, "ptr", bstrName, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateTemplate(ppValue)
    }

    /**
     * Retrieves an IX509CertificateTemplate object from the collection by object identifier.
     * @param {IObjectId} pOid 
     * @returns {IX509CertificateTemplate} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplates-get_itembyoid
     */
    get_ItemByOid(pOid) {
        result := ComCall(14, this, "ptr", pOid, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateTemplate(ppValue)
    }
}
