#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include .\IX509Extension.ahk

/**
 * Defines methods and properties that can be used to initialize or retrieve a CertificateTemplate extension.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensiontemplate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionTemplate extends IX509Extension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509ExtensionTemplate
     * @type {Guid}
     */
    static IID => Guid("{728ab312-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_TemplateOid", "get_MajorVersion", "get_MinorVersion"]

    /**
     * @type {IObjectId} 
     */
    TemplateOid {
        get => this.get_TemplateOid()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * 
     * @param {IObjectId} pTemplateOid 
     * @param {Integer} MajorVersion 
     * @param {Integer} MinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-initializeencode
     */
    InitializeEncode(pTemplateOid, MajorVersion, MinorVersion) {
        result := ComCall(12, this, "ptr", pTemplateOid, "int", MajorVersion, "int", MinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-get_templateoid
     */
    get_TemplateOid() {
        result := ComCall(14, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensiontemplate-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
