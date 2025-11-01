#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IX509CertificateTemplate} pValue 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pValue) {
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commitFlags 
     * @param {BSTR} strServerContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-commit
     */
    Commit(commitFlags, strServerContext) {
        strServerContext := strServerContext is String ? BSTR.Alloc(strServerContext).Value : strServerContext

        result := ComCall(8, this, "int", commitFlags, "ptr", strServerContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-get_property
     */
    get_Property(property, pValue) {
        result := ComCall(9, this, "int", property, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-put_property
     */
    put_Property(property, value) {
        result := ComCall(10, this, "int", property, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplatewritable-get_template
     */
    get_Template(ppValue) {
        result := ComCall(11, this, "ptr*", ppValue, "HRESULT")
        return result
    }
}
