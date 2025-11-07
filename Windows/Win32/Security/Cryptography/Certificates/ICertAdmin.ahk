#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides administration functionality for properly authorized clients.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-icertadmin
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertAdmin extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertAdmin
     * @type {Guid}
     */
    static IID => Guid("{34df6950-7fb6-11d0-8817-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValidCertificate", "GetRevocationReason", "RevokeCertificate", "SetRequestAttributes", "SetCertificateExtension", "DenyRequest", "ResubmitRequest", "PublishCRL", "GetCRL", "ImportCertificate"]

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strSerialNumber 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-isvalidcertificate
     */
    IsValidCertificate(strConfig, strSerialNumber) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(7, this, "ptr", strConfig, "ptr", strSerialNumber, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-getrevocationreason
     */
    GetRevocationReason() {
        result := ComCall(8, this, "int*", &pReason := 0, "HRESULT")
        return pReason
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strSerialNumber 
     * @param {Integer} Reason 
     * @param {Float} Date 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-revokecertificate
     */
    RevokeCertificate(strConfig, strSerialNumber, Reason, Date) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(9, this, "ptr", strConfig, "ptr", strSerialNumber, "int", Reason, "double", Date, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {BSTR} strAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-setrequestattributes
     */
    SetRequestAttributes(strConfig, RequestId, strAttributes) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strAttributes := strAttributes is String ? BSTR.Alloc(strAttributes).Value : strAttributes

        result := ComCall(10, this, "ptr", strConfig, "int", RequestId, "ptr", strAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {BSTR} strExtensionName 
     * @param {Integer} Type 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-setcertificateextension
     */
    SetCertificateExtension(strConfig, RequestId, strExtensionName, Type, Flags, pvarValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(11, this, "ptr", strConfig, "int", RequestId, "ptr", strExtensionName, "int", Type, "int", Flags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-denyrequest
     */
    DenyRequest(strConfig, RequestId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(12, this, "ptr", strConfig, "int", RequestId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-resubmitrequest
     */
    ResubmitRequest(strConfig, RequestId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(13, this, "ptr", strConfig, "int", RequestId, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Float} Date 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-publishcrl
     */
    PublishCRL(strConfig, Date) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(14, this, "ptr", strConfig, "double", Date, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} Flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-getcrl
     */
    GetCRL(strConfig, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrCRL := BSTR()
        result := ComCall(15, this, "ptr", strConfig, "int", Flags, "ptr", pstrCRL, "HRESULT")
        return pstrCRL
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strCertificate 
     * @param {Integer} Flags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin-importcertificate
     */
    ImportCertificate(strConfig, strCertificate, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(16, this, "ptr", strConfig, "ptr", strCertificate, "int", Flags, "int*", &pRequestId := 0, "HRESULT")
        return pRequestId
    }
}
