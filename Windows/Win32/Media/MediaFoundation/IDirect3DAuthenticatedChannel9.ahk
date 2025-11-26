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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCertificateSize", "GetCertificate", "NegotiateKeyExchange", "Query", "Configure"]

    /**
     * Gets the size of the driver's certificate chain.
     * @param {Pointer<Integer>} pCertificateSize Receives the size of the certificate chain, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dauthenticatedchannel9-getcertificatesize
     */
    GetCertificateSize(pCertificateSize) {
        pCertificateSizeMarshal := pCertificateSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCertificateSizeMarshal, pCertificateSize, "HRESULT")
        return result
    }

    /**
     * Gets the driver's certificate chain.
     * @param {Integer} CertifacteSize The size of the <i>ppCertificate</i> array, in bytes. To get the size of the certificate chain, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dauthenticatedchannel9-getcertificatesize">IDirect3DAuthenticatedChannel9::GetCertificateSize</a>.
     * @param {Pointer<Integer>} ppCertificate A pointer to a byte array that receives the driver's X.509 certificate chain. The caller must allocate the array.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dauthenticatedchannel9-getcertificate
     */
    GetCertificate(CertifacteSize, ppCertificate) {
        ppCertificateMarshal := ppCertificate is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", CertifacteSize, ppCertificateMarshal, ppCertificate, "HRESULT")
        return result
    }

    /**
     * Establishes a session key for the authenticated channel.
     * @param {Integer} DataSize The size of the data in the <i>pData</i> array, in bytes.
     * @param {Pointer<Void>} pData A pointer to a byte array that contains the encrypted session key. The buffer must contain 256 bytes of data, encrypted using RSA Encryption Scheme - Optimal Asymmetric Encryption Padding (RSAES-OAEP).
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dauthenticatedchannel9-negotiatekeyexchange
     */
    NegotiateKeyExchange(DataSize, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", DataSize, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Sends a query to the authenticated channel.
     * @param {Integer} InputSize The size of the <i>pInput</i> array, in bytes.
     * @param {Pointer<Void>} pInput A pointer to a byte array that contains input data for the query. This array always starts with a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dauthenticatedchannel-query-input">D3DAUTHENTICATEDCHANNEL_QUERY_INPUT</a> structure. The <b>QueryType</b> member of the structure specifies the query and defines the meaning of the rest of the array.
     * @param {Integer} OutputSize The size of the <i>pOutput</i> array, in bytes.
     * @param {Pointer<Void>} pOutput A pointer to a byte array that receives the result of the query. This array always starts with a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dauthenticatedchannel-query-output">D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT</a> structure. The meaning of the rest of the array depends on the query.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dauthenticatedchannel9-query
     */
    Query(InputSize, pInput, OutputSize, pOutput) {
        pInputMarshal := pInput is VarRef ? "ptr" : "ptr"
        pOutputMarshal := pOutput is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "uint", InputSize, pInputMarshal, pInput, "uint", OutputSize, pOutputMarshal, pOutput, "HRESULT")
        return result
    }

    /**
     * Sends a configuration command to the authenticated channel.
     * @param {Integer} InputSize The size of the <i>pInput</i> array, in bytes.
     * @param {Pointer<Void>} pInput A pointer to a byte array that contains input data for the command. This buffer always starts with a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dauthenticatedchannel-configure-input">D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT</a> structure. The <b>ConfigureType</b> member of the structure specifies the command and defines the meaning of the rest of the buffer.
     * @param {Pointer<D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT>} pOutput A pointer to a <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dauthenticatedchannel-configure-output">D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT</a> structure that receives the response to the command.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dauthenticatedchannel9-configure
     */
    Configure(InputSize, pInput, pOutput) {
        pInputMarshal := pInput is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "uint", InputSize, pInputMarshal, pInput, "ptr", pOutput, "HRESULT")
        return result
    }
}
