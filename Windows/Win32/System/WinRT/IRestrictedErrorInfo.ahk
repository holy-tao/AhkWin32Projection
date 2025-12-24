#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents the details of an error, including restricted error information.
 * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IRestrictedErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRestrictedErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{82ba7092-4c88-427d-a7bc-16dd93feb67e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorDetails", "GetReference"]

    /**
     * Returns information about an error, including the restricted error description.
     * @param {Pointer<BSTR>} description Type: <b>BSTR*</b>
     * 
     * The error description.
     * @param {Pointer<HRESULT>} error Type: <b>HRESULT*</b>
     * 
     * The error code associated with the error condition.
     * @param {Pointer<BSTR>} restrictedDescription Type: <b>BSTR*</b>
     * 
     * The restricted error description.
     * @param {Pointer<BSTR>} capabilitySid TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nf-restrictederrorinfo-irestrictederrorinfo-geterrordetails
     */
    GetErrorDetails(description, error, restrictedDescription, capabilitySid) {
        errorMarshal := error is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", description, errorMarshal, error, "ptr", restrictedDescription, "ptr", capabilitySid, "HRESULT")
        return result
    }

    /**
     * Returns a reference to restricted error information.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * A reference to the error information.
     * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nf-restrictederrorinfo-irestrictederrorinfo-getreference
     */
    GetReference() {
        reference := BSTR()
        result := ComCall(4, this, "ptr", reference, "HRESULT")
        return reference
    }
}
