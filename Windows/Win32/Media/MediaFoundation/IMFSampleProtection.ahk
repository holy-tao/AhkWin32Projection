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
     * 
     * @param {Pointer<UInt32>} pdwVersion 
     * @returns {HRESULT} 
     */
    GetInputProtectionVersion(pdwVersion) {
        result := ComCall(3, this, "uint*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVersion 
     * @returns {HRESULT} 
     */
    GetOutputProtectionVersion(pdwVersion) {
        result := ComCall(4, this, "uint*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Pointer<Byte>} ppCert 
     * @param {Pointer<UInt32>} pcbCert 
     * @returns {HRESULT} 
     */
    GetProtectionCertificate(dwVersion, ppCert, pcbCert) {
        result := ComCall(5, this, "uint", dwVersion, "char*", ppCert, "uint*", pcbCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Integer} dwOutputId 
     * @param {Pointer<Byte>} pbCert 
     * @param {Integer} cbCert 
     * @param {Pointer<Byte>} ppbSeed 
     * @param {Pointer<UInt32>} pcbSeed 
     * @returns {HRESULT} 
     */
    InitOutputProtection(dwVersion, dwOutputId, pbCert, cbCert, ppbSeed, pcbSeed) {
        result := ComCall(6, this, "uint", dwVersion, "uint", dwOutputId, "char*", pbCert, "uint", cbCert, "char*", ppbSeed, "uint*", pcbSeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Integer} dwInputId 
     * @param {Pointer<Byte>} pbSeed 
     * @param {Integer} cbSeed 
     * @returns {HRESULT} 
     */
    InitInputProtection(dwVersion, dwInputId, pbSeed, cbSeed) {
        result := ComCall(7, this, "uint", dwVersion, "uint", dwInputId, "char*", pbSeed, "uint", cbSeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
