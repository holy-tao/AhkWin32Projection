#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a communication channel with the graphics driver or the Direct3D runtime.To get a pointer to this interface, call IDirect3DDevice9Video::CreateAuthenticatedChannel.
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3dauthenticatedchannel9
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirect3DAuthenticatedChannel9 extends IUnknown{
    /**
     * The interface identifier for IDirect3DAuthenticatedChannel9
     * @type {Guid}
     */
    static IID => Guid("{ff24beee-da21-4beb-98b5-d2f899f98af9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pCertificateSize 
     * @returns {HRESULT} 
     */
    GetCertificateSize(pCertificateSize) {
        result := ComCall(3, this, "uint*", pCertificateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CertifacteSize 
     * @param {Pointer<Byte>} ppCertificate 
     * @returns {HRESULT} 
     */
    GetCertificate(CertifacteSize, ppCertificate) {
        result := ComCall(4, this, "uint", CertifacteSize, "char*", ppCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    NegotiateKeyExchange(DataSize, pData) {
        result := ComCall(5, this, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InputSize 
     * @param {Pointer<Void>} pInput 
     * @param {Integer} OutputSize 
     * @param {Pointer<Void>} pOutput 
     * @returns {HRESULT} 
     */
    Query(InputSize, pInput, OutputSize, pOutput) {
        result := ComCall(6, this, "uint", InputSize, "ptr", pInput, "uint", OutputSize, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InputSize 
     * @param {Pointer<Void>} pInput 
     * @param {Pointer<D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT>} pOutput 
     * @returns {HRESULT} 
     */
    Configure(InputSize, pInput, pOutput) {
        result := ComCall(7, this, "uint", InputSize, "ptr", pInput, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
