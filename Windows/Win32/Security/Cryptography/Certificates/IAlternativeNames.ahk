#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAlternativeName.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Contains methods and properties that enable you to manage a collection of IAlternativeName objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ialternativenames
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IAlternativeNames extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlternativeNames
     * @type {Guid}
     */
    static IID => Guid("{728ab314-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear"]

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
     * The IAlternativeNames::get_ItemByIndex function retrieves an object from the collection by index number.
     * @param {Integer} Index 
     * @returns {IAlternativeName} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativenames-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAlternativeName(pVal)
    }

    /**
     * Retrieves the number of objects in the collection. (IAlternativeNames.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativenames-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the enumerator for the collection. (IAlternativeNames.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativenames-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pVal)
    }

    /**
     * Adds an object to the collection. (IAlternativeNames.Add)
     * @param {IAlternativeName} pVal Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ialternativename">IAlternativeName</a> interface to add.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativenames-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes an object from the collection by index number. (IAlternativeNames.Remove)
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativenames-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all objects from the collection. (IAlternativeNames.Clear)
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ialternativenames-clear
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
