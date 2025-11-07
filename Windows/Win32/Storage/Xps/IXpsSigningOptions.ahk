#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include ..\Packaging\Opc\IOpcSignatureCustomObjectSet.ahk
#Include ..\Packaging\Opc\IOpcSignatureReferenceSet.ahk
#Include ..\Packaging\Opc\IOpcCertificateSet.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the individual signing options that are used by new signatures.
 * @remarks
 * 
  * To create a new instance of this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>.
  * 
  * When a new instance of this interface is returned by <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-createsigningoptions">IXpsSignatureManager::CreateSigningOptions</a>, the SignatureMethod and  DigestMethod  properties are not initialized. These properties  must be initialized before the new interface can be used as a parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturemanager-sign">Sign</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssigningoptions
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSigningOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSigningOptions
     * @type {Guid}
     */
    static IID => Guid("{7718eae4-3215-49be-af5b-594fef7fcfa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignatureId", "SetSignatureId", "GetSignatureMethod", "SetSignatureMethod", "GetDigestMethod", "SetDigestMethod", "GetSignaturePartName", "SetSignaturePartName", "GetPolicy", "SetPolicy", "GetSigningTimeFormat", "SetSigningTimeFormat", "GetCustomObjects", "GetCustomReferences", "GetCertificateSet", "GetFlags", "SetFlags"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsignatureid
     */
    GetSignatureId() {
        result := ComCall(3, this, "ptr*", &signatureId := 0, "HRESULT")
        return signatureId
    }

    /**
     * 
     * @param {PWSTR} signatureId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsignatureid
     */
    SetSignatureId(signatureId) {
        signatureId := signatureId is String ? StrPtr(signatureId) : signatureId

        result := ComCall(4, this, "ptr", signatureId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsignaturemethod
     */
    GetSignatureMethod() {
        result := ComCall(5, this, "ptr*", &signatureMethod := 0, "HRESULT")
        return signatureMethod
    }

    /**
     * 
     * @param {PWSTR} signatureMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsignaturemethod
     */
    SetSignatureMethod(signatureMethod) {
        signatureMethod := signatureMethod is String ? StrPtr(signatureMethod) : signatureMethod

        result := ComCall(6, this, "ptr", signatureMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getdigestmethod
     */
    GetDigestMethod() {
        result := ComCall(7, this, "ptr*", &digestMethod := 0, "HRESULT")
        return digestMethod
    }

    /**
     * 
     * @param {PWSTR} digestMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setdigestmethod
     */
    SetDigestMethod(digestMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(8, this, "ptr", digestMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsignaturepartname
     */
    GetSignaturePartName() {
        result := ComCall(9, this, "ptr*", &signaturePartName := 0, "HRESULT")
        return IOpcPartUri(signaturePartName)
    }

    /**
     * 
     * @param {IOpcPartUri} signaturePartName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsignaturepartname
     */
    SetSignaturePartName(signaturePartName) {
        result := ComCall(10, this, "ptr", signaturePartName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getpolicy
     */
    GetPolicy() {
        result := ComCall(11, this, "int*", &policy := 0, "HRESULT")
        return policy
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setpolicy
     */
    SetPolicy(policy) {
        result := ComCall(12, this, "int", policy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getsigningtimeformat
     */
    GetSigningTimeFormat() {
        result := ComCall(13, this, "int*", &timeFormat := 0, "HRESULT")
        return timeFormat
    }

    /**
     * 
     * @param {Integer} timeFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-setsigningtimeformat
     */
    SetSigningTimeFormat(timeFormat) {
        result := ComCall(14, this, "int", timeFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcSignatureCustomObjectSet} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcustomobjects
     */
    GetCustomObjects() {
        result := ComCall(15, this, "ptr*", &customObjectSet := 0, "HRESULT")
        return IOpcSignatureCustomObjectSet(customObjectSet)
    }

    /**
     * 
     * @returns {IOpcSignatureReferenceSet} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcustomreferences
     */
    GetCustomReferences() {
        result := ComCall(16, this, "ptr*", &customReferenceSet := 0, "HRESULT")
        return IOpcSignatureReferenceSet(customReferenceSet)
    }

    /**
     * 
     * @returns {IOpcCertificateSet} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getcertificateset
     */
    GetCertificateSet() {
        result := ComCall(17, this, "ptr*", &certificateSet := 0, "HRESULT")
        return IOpcCertificateSet(certificateSet)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssigningoptions-getflags
     */
    GetFlags() {
        result := ComCall(18, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(flags) {
        result := ComCall(19, this, "int", flags, "HRESULT")
        return result
    }
}
