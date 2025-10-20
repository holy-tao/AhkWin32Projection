#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to certificates.
 * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nn-wmsecure-iwmauthorizer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMAuthorizer extends IUnknown{
    /**
     * The interface identifier for IWMAuthorizer
     * @type {Guid}
     */
    static IID => Guid("{d9b67d36-a9ad-4eb4-baef-db284ef5504c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcCerts 
     * @returns {HRESULT} 
     */
    GetCertCount(pcCerts) {
        result := ComCall(3, this, "uint*", pcCerts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Byte>} ppbCertData 
     * @returns {HRESULT} 
     */
    GetCert(dwIndex, ppbCertData) {
        result := ComCall(4, this, "uint", dwIndex, "char*", ppbCertData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCertIndex 
     * @param {Pointer<Byte>} pbSharedData 
     * @param {Pointer<Byte>} pbCert 
     * @param {Pointer<Byte>} ppbSharedData 
     * @returns {HRESULT} 
     */
    GetSharedData(dwCertIndex, pbSharedData, pbCert, ppbSharedData) {
        result := ComCall(5, this, "uint", dwCertIndex, "char*", pbSharedData, "char*", pbCert, "char*", ppbSharedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
