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
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strSerialNumber 
     * @param {Pointer<Int32>} pDisposition 
     * @returns {HRESULT} 
     */
    IsValidCertificate(strConfig, strSerialNumber, pDisposition) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(7, this, "ptr", strConfig, "ptr", strSerialNumber, "int*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pReason 
     * @returns {HRESULT} 
     */
    GetRevocationReason(pReason) {
        result := ComCall(8, this, "int*", pReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strSerialNumber 
     * @param {Integer} Reason 
     * @param {Float} Date 
     * @returns {HRESULT} 
     */
    RevokeCertificate(strConfig, strSerialNumber, Reason, Date) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(9, this, "ptr", strConfig, "ptr", strSerialNumber, "int", Reason, "double", Date, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {BSTR} strAttributes 
     * @returns {HRESULT} 
     */
    SetRequestAttributes(strConfig, RequestId, strAttributes) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strAttributes := strAttributes is String ? BSTR.Alloc(strAttributes).Value : strAttributes

        result := ComCall(10, this, "ptr", strConfig, "int", RequestId, "ptr", strAttributes, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    SetCertificateExtension(strConfig, RequestId, strExtensionName, Type, Flags, pvarValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(11, this, "ptr", strConfig, "int", RequestId, "ptr", strExtensionName, "int", Type, "int", Flags, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @returns {HRESULT} 
     */
    DenyRequest(strConfig, RequestId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(12, this, "ptr", strConfig, "int", RequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {Pointer<Int32>} pDisposition 
     * @returns {HRESULT} 
     */
    ResubmitRequest(strConfig, RequestId, pDisposition) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(13, this, "ptr", strConfig, "int", RequestId, "int*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Float} Date 
     * @returns {HRESULT} 
     */
    PublishCRL(strConfig, Date) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(14, this, "ptr", strConfig, "double", Date, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrCRL 
     * @returns {HRESULT} 
     */
    GetCRL(strConfig, Flags, pstrCRL) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(15, this, "ptr", strConfig, "int", Flags, "ptr", pstrCRL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strCertificate 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} pRequestId 
     * @returns {HRESULT} 
     */
    ImportCertificate(strConfig, strCertificate, Flags, pRequestId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(16, this, "ptr", strConfig, "ptr", strCertificate, "int", Flags, "int*", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
