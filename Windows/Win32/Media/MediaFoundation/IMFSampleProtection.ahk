#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides encryption for media data inside the protected media path (PMP).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsampleprotection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleProtection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSampleProtection
     * @type {Guid}
     */
    static IID => Guid("{8e36395f-c7b9-43c4-a54d-512b4af63c95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputProtectionVersion", "GetOutputProtectionVersion", "GetProtectionCertificate", "InitOutputProtection", "InitInputProtection"]

    /**
     * 
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleprotection-getinputprotectionversion
     */
    GetInputProtectionVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleprotection-getoutputprotectionversion
     */
    GetOutputProtectionVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Pointer<Pointer<Integer>>} ppCert 
     * @param {Pointer<Integer>} pcbCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleprotection-getprotectioncertificate
     */
    GetProtectionCertificate(dwVersion, ppCert, pcbCert) {
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwVersion, "ptr*", ppCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Integer} dwOutputId 
     * @param {Pointer<Integer>} pbCert 
     * @param {Integer} cbCert 
     * @param {Pointer<Pointer<Integer>>} ppbSeed 
     * @param {Pointer<Integer>} pcbSeed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleprotection-initoutputprotection
     */
    InitOutputProtection(dwVersion, dwOutputId, pbCert, cbCert, ppbSeed, pcbSeed) {
        pbCertMarshal := pbCert is VarRef ? "char*" : "ptr"
        pcbSeedMarshal := pcbSeed is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwVersion, "uint", dwOutputId, pbCertMarshal, pbCert, "uint", cbCert, "ptr*", ppbSeed, pcbSeedMarshal, pcbSeed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Integer} dwInputId 
     * @param {Pointer<Integer>} pbSeed 
     * @param {Integer} cbSeed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleprotection-initinputprotection
     */
    InitInputProtection(dwVersion, dwInputId, pbSeed, cbSeed) {
        pbSeedMarshal := pbSeed is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dwVersion, "uint", dwInputId, pbSeedMarshal, pbSeed, "uint", cbSeed, "HRESULT")
        return result
    }
}
