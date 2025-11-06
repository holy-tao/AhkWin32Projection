#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509CertificateTemplate interface represents a certificate request template. It can be used to initialize an IX509CertificateTemplateWritable interface.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificatetemplate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateTemplate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateTemplate
     * @type {Guid}
     */
    static IID => Guid("{54244a13-555a-4e22-896d-1b0e52f76406}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Property"]

    /**
     * 
     * @param {Integer} property 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificatetemplate-get_property
     */
    get_Property(property) {
        pValue := VARIANT()
        result := ComCall(7, this, "int", property, "ptr", pValue, "HRESULT")
        return pValue
    }
}
