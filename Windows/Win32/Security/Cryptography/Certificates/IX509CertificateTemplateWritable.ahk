#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CommitTemplateFlags.ahk" { CommitTemplateFlags }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EnrollmentTemplateProperty.ahk" { EnrollmentTemplateProperty }
#Import ".\IX509CertificateTemplate.ahk" { IX509CertificateTemplate }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IX509CertificateTemplateWritable interface enables you to add a template to or delete it from a template store. Currently, Active Directory is the only available store.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificatetemplatewritable
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateTemplateWritable extends IDispatch {
    /**
     * The interface identifier for IX509CertificateTemplateWritable
     * @type {Guid}
     */
    static IID := Guid("{f49466a7-395a-4e9e-b6e7-32b331600dc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateTemplateWritable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize   : IntPtr
        Commit       : IntPtr
        get_Property : IntPtr
        put_Property : IntPtr
        get_Template : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateTemplateWritable.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <i>pValue</i> parameter does not point to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> interface.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplatewritable">IX509CertificateTemplateWritable</a> has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-initialize
     */
    Initialize(pValue) {
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Deletes a template from or saves it to Active Directory.
     * @remarks
     * When <b>CommitFlagSaveTemplateGenerateOID</b> is specified in the <i>commitFlags</i> argument, this method will not succeed unless the template and OID containers have already been created. These containers can be created in any of the following ways:
     * 
     * <ul>
     * <li>Installing an enterprise certification authority on the server.</li>
     * <li>Launching the Certtmpl.msc snap-in.</li>
     * <li>Using the <b>Certutil.exe -installDefaultTemplates</b> command to install the default templates.</li>
     * </ul>
     * @param {CommitTemplateFlags} commitFlags 
     * @param {BSTR} strServerContext A <b>BSTR</b> variable that contains the DNS name of the Active Directory server to which the changes will be applied. If this value is <b>NULL</b>, the changes will be applied to the default domain controller.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-commit">Commit</a> method is not supported for default templates.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplatewritable">IX509CertificateTemplateWritable</a> object has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-commit
     */
    Commit(commitFlags, strServerContext) {
        strServerContext := strServerContext is String ? BSTR.Alloc(strServerContext).Value : strServerContext

        result := ComCall(8, this, CommitTemplateFlags, commitFlags, BSTR, strServerContext, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a property value for the IX509CertificateTemplateWritable object. (Get)
     * @remarks
     * Currently, TemplatePropSecurityDescriptor is the only property that you can set. The property value must be a <b>VARIANT</b> of type <b>VT_BSTR</b> or <b>VT_BYREF|VT_BSTR</b> and must be a valid SDDL string.
     * @param {EnrollmentTemplateProperty} _property 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-get_property
     */
    get_Property(_property) {
        pValue := VARIANT()
        result := ComCall(9, this, EnrollmentTemplateProperty, _property, VARIANT.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a property value for the IX509CertificateTemplateWritable object. (Put)
     * @remarks
     * Currently, TemplatePropSecurityDescriptor is the only property that you can set. The property value must be a <b>VARIANT</b> of type <b>VT_BSTR</b> or <b>VT_BYREF|VT_BSTR</b> and must be a valid SDDL string.
     * @param {EnrollmentTemplateProperty} _property 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-put_property
     */
    put_Property(_property, value) {
        result := ComCall(10, this, EnrollmentTemplateProperty, _property, VARIANT, value, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the IX509CertificateTemplate object that was used to initialize this IX509CertificateTemplateWritable instance.
     * @remarks
     * You must call the COM <b>Release</b> method to free the interface pointer when you are finished using it.
     * @returns {IX509CertificateTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-get_template
     */
    get_Template() {
        result := ComCall(11, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateTemplate(ppValue)
    }

    Query(iid) {
        if (IX509CertificateTemplateWritable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 3)
        this.vtbl.get_Property := CallbackCreate(GetMethod(implObj, "get_Property"), flags, 3)
        this.vtbl.put_Property := CallbackCreate(GetMethod(implObj, "put_Property"), flags, 3)
        this.vtbl.get_Template := CallbackCreate(GetMethod(implObj, "get_Template"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.get_Property)
        CallbackFree(this.vtbl.put_Property)
        CallbackFree(this.vtbl.get_Template)
    }
}
