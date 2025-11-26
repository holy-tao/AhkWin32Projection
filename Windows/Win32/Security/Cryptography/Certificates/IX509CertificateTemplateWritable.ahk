#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IX509CertificateTemplate.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509CertificateTemplateWritable interface enables you to add a template to or delete it from a template store. Currently, Active Directory is the only available store.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificatetemplatewritable
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateTemplateWritable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateTemplateWritable
     * @type {Guid}
     */
    static IID => Guid("{f49466a7-395a-4e9e-b6e7-32b331600dc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Commit", "get_Property", "put_Property", "get_Template"]

    /**
     * @type {IX509CertificateTemplate} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * Initializes an IX509CertificateTemplateWritable object from a template.
     * @param {IX509CertificateTemplate} pValue Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> interface that represents a certificate request template.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_POINTER</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pValue</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pValue</i> parameter does not point to an <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplatewritable">IX509CertificateTemplateWritable</a> has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplatewritable-initialize
     */
    Initialize(pValue) {
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Deletes a template from or saves it to Active Directory.
     * @param {Integer} commitFlags 
     * @param {BSTR} strServerContext A <b>BSTR</b> variable that contains the DNS name of the Active Directory server to which the changes will be applied. If this value is <b>NULL</b>, the changes will be applied to the default domain controller.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>CommitFlagSaveTemplateGenerateOID</b> was specified in the <i>commitFlags</i> argument but a template with a matching common name or a matching object identifier (OID) already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>CommitFlagDelete</i> was specified in the <i>commitFlags</i> argument and a template with the same Common Name was found but the OID did not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDEINED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the appropriate permission to save or delete a template. The caller must have write and delete permission on the template container and template objects in Active Directory. If the caller has delete permission on the template container and objects but does not have delete permission on the OID container and objects, the template will be deleted but the OID will not be.
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
     * Either <b>CommitFlagSaveTemplateUseCurrentOID</b> or <b>CommitFlagSaveTemplateOverwrite</b> was specified in the <i>commitFlags</i> argument. These values are not currently used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>CommitFlagDelete</i> was specified in the <i>commitFlags</i> argument but a template having a matching Common Name (CN) could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-commit">Commit</a> method is not supported for default templates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplatewritable">IX509CertificateTemplateWritable</a> object has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplatewritable-commit
     */
    Commit(commitFlags, strServerContext) {
        strServerContext := strServerContext is String ? BSTR.Alloc(strServerContext).Value : strServerContext

        result := ComCall(8, this, "int", commitFlags, "ptr", strServerContext, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a property value for the IX509CertificateTemplateWritable object.
     * @remarks
     * 
     * Currently, TemplatePropSecurityDescriptor is the only property that you can set. The property value must be a <b>VARIANT</b> of type <b>VT_BSTR</b> or <b>VT_BYREF|VT_BSTR</b> and must be a valid SDDL string.
     * 
     * 
     * @param {Integer} property 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplatewritable-get_property
     */
    get_Property(property) {
        pValue := VARIANT()
        result := ComCall(9, this, "int", property, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a property value for the IX509CertificateTemplateWritable object.
     * @remarks
     * 
     * Currently, TemplatePropSecurityDescriptor is the only property that you can set. The property value must be a <b>VARIANT</b> of type <b>VT_BSTR</b> or <b>VT_BYREF|VT_BSTR</b> and must be a valid SDDL string.
     * 
     * 
     * @param {Integer} property 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplatewritable-put_property
     */
    put_Property(property, value) {
        result := ComCall(10, this, "int", property, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the IX509CertificateTemplate object that was used to initialize this IX509CertificateTemplateWritable instance.
     * @remarks
     * 
     * You must call the COM <b>Release</b> method to free the interface pointer when you are finished using it.
     * 
     * 
     * @returns {IX509CertificateTemplate} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificatetemplatewritable-get_template
     */
    get_Template() {
        result := ComCall(11, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateTemplate(ppValue)
    }
}
