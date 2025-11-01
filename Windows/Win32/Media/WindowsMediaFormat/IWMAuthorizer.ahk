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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCertCount", "GetCert", "GetSharedData"]

    /**
     * 
     * @param {Pointer<Integer>} pcCerts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmauthorizer-getcertcount
     */
    GetCertCount(pcCerts) {
        pcCertsMarshal := pcCerts is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcCertsMarshal, pcCerts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Pointer<Integer>>} ppbCertData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmauthorizer-getcert
     */
    GetCert(dwIndex, ppbCertData) {
        result := ComCall(4, this, "uint", dwIndex, "ptr*", ppbCertData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCertIndex 
     * @param {Pointer<Integer>} pbSharedData 
     * @param {Pointer<Integer>} pbCert 
     * @param {Pointer<Pointer<Integer>>} ppbSharedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsecure/nf-wmsecure-iwmauthorizer-getshareddata
     */
    GetSharedData(dwCertIndex, pbSharedData, pbCert, ppbSharedData) {
        pbSharedDataMarshal := pbSharedData is VarRef ? "char*" : "ptr"
        pbCertMarshal := pbCert is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", dwCertIndex, pbSharedDataMarshal, pbSharedData, pbCertMarshal, pbCert, "ptr*", ppbSharedData, "HRESULT")
        return result
    }
}
