#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISmimeCapability.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Defines the following methods and properties to manage a collection of ISmimeCapability objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ismimecapabilities
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ISmimeCapabilities extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmimeCapabilities
     * @type {Guid}
     */
    static IID => Guid("{728ab31a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "AddFromCsp", "AddAvailableSmimeCapabilities"]

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
     * The ISmimeCapabilities::get_ItemByIndex function retrieves an object from the collection by index number.
     * @param {Integer} Index 
     * @returns {ISmimeCapability} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISmimeCapability(pVal)
    }

    /**
     * Retrieves the number of objects in the collection. (ISmimeCapabilities.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves the enumerator for the collection. (ISmimeCapabilities.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pVal)
    }

    /**
     * Adds an ISmimeCapability object to the collection.
     * @param {ISmimeCapability} pVal Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ismimecapability">ISmimeCapability</a> interface to add.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes an object from the collection by index value. (ISmimeCapabilities.Remove)
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all objects from the collection. (ISmimeCapabilities.Clear)
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-clear
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds objects to the collection by identifying the encryption algorithms supported by a specific cryptographic provider.
     * @param {ICspInformation} pValue Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents the provider.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-addfromcsp
     */
    AddFromCsp(pValue) {
        result := ComCall(13, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds ISmimeCapability objects to the collection by identifying the encryption algorithms supported by the default RSA cryptographic provider.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> variable that identifies the certificate store context. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ismimecapabilities-addavailablesmimecapabilities
     */
    AddAvailableSmimeCapabilities(MachineContext) {
        result := ComCall(14, this, "short", MachineContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
