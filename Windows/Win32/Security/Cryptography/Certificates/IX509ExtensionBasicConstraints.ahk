#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extension.ahk

/**
 * Enables you to specify whether the certificate subject is a certification authority and, if so, the depth of the subordinate certification authority chain that can exist beneath the certification authority for which this extension ID is defined.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensionbasicconstraints
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionBasicConstraints extends IX509Extension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509ExtensionBasicConstraints
     * @type {Guid}
     */
    static IID => Guid("{728ab316-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_IsCA", "get_PathLenConstraint"]

    /**
     * 
     * @param {VARIANT_BOOL} IsCA 
     * @param {Integer} PathLenConstraint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionbasicconstraints-initializeencode
     */
    InitializeEncode(IsCA, PathLenConstraint) {
        result := ComCall(12, this, "short", IsCA, "int", PathLenConstraint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionbasicconstraints-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionbasicconstraints-get_isca
     */
    get_IsCA(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionbasicconstraints-get_pathlenconstraint
     */
    get_PathLenConstraint(pValue) {
        result := ComCall(15, this, "int*", pValue, "HRESULT")
        return result
    }
}
