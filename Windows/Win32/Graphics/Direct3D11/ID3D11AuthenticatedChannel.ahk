#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Provides a communication channel with the graphics driver or the Microsoft Direct3D runtime.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createauthenticatedchannel">ID3D11VideoDevice::CreateAuthenticatedChannel</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11authenticatedchannel
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11AuthenticatedChannel extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11AuthenticatedChannel
     * @type {Guid}
     */
    static IID => Guid("{3015a308-dcbd-47aa-a747-192486d14d4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCertificateSize", "GetCertificate", "GetChannelHandle"]

    /**
     * Gets the size of the driver's certificate chain.
     * @returns {Integer} Receives the size of the certificate chain, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11authenticatedchannel-getcertificatesize
     */
    GetCertificateSize() {
        result := ComCall(7, this, "uint*", &pCertificateSize := 0, "HRESULT")
        return pCertificateSize
    }

    /**
     * Gets the driver's certificate chain.
     * @param {Integer} CertificateSize The size of the <i>pCertificate</i> array, in bytes. To get the size of the certificate chain, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize">ID3D11CryptoSession::GetCertificateSize</a>.
     * @param {Pointer} pCertificate A pointer to a byte array that receives the driver's certificate chain. The caller must allocate the array.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11authenticatedchannel-getcertificate
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(8, this, "uint", CertificateSize, "ptr", pCertificate, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the authenticated channel.
     * @param {Pointer<HANDLE>} pChannelHandle Receives a handle to the channel.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11authenticatedchannel-getchannelhandle
     */
    GetChannelHandle(pChannelHandle) {
        ComCall(9, this, "ptr", pChannelHandle)
    }
}
