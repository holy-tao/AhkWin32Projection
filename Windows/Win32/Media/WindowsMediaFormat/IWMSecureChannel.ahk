#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMAuthorizer.ahk

/**
 * The IWMSecureChannel interface provides methods that allow two DLLs to validate each other and perform secure communication.
 * @see https://docs.microsoft.com/windows/win32/api//wmsecure/nn-wmsecure-iwmsecurechannel
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSecureChannel extends IWMAuthorizer{
    /**
     * The interface identifier for IWMSecureChannel
     * @type {Guid}
     */
    static IID => Guid("{2720598a-d0f2-4189-bd10-91c46ef0936f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<IWMAuthorizer>} pCert 
     * @returns {HRESULT} 
     */
    WMSC_AddCertificate(pCert) {
        result := ComCall(6, this, "ptr", pCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbCertSig 
     * @param {Integer} cbCertSig 
     * @returns {HRESULT} 
     */
    WMSC_AddSignature(pbCertSig, cbCertSig) {
        result := ComCall(7, this, "char*", pbCertSig, "uint", cbCertSig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMSecureChannel>} pOtherSide 
     * @returns {HRESULT} 
     */
    WMSC_Connect(pOtherSide) {
        result := ComCall(8, this, "ptr", pOtherSide, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsConnected 
     * @returns {HRESULT} 
     */
    WMSC_IsConnected(pfIsConnected) {
        result := ComCall(9, this, "ptr", pfIsConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WMSC_Disconnect() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppbCertificate 
     * @param {Pointer<UInt32>} pdwSignature 
     * @returns {HRESULT} 
     */
    WMSC_GetValidCertificate(ppbCertificate, pdwSignature) {
        result := ComCall(11, this, "char*", ppbCertificate, "uint*", pdwSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    WMSC_Encrypt(pbData, cbData) {
        result := ComCall(12, this, "char*", pbData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    WMSC_Decrypt(pbData, cbData) {
        result := ComCall(13, this, "char*", pbData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WMSC_Lock() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WMSC_Unlock() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCertIndex 
     * @param {Pointer<Byte>} pbSharedData 
     * @returns {HRESULT} 
     */
    WMSC_SetSharedData(dwCertIndex, pbSharedData) {
        result := ComCall(16, this, "uint", dwCertIndex, "char*", pbSharedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
