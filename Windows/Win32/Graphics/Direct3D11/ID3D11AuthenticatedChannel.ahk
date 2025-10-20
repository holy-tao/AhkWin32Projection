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
     * 
     * @param {Pointer<UInt32>} pCertificateSize 
     * @returns {HRESULT} 
     */
    GetCertificateSize(pCertificateSize) {
        result := ComCall(7, this, "uint*", pCertificateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CertificateSize 
     * @param {Pointer} pCertificate 
     * @returns {HRESULT} 
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(8, this, "uint", CertificateSize, "ptr", pCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} pChannelHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    GetChannelHandle(pChannelHandle) {
        ComCall(9, this, "ptr", pChannelHandle)
        return result
    }
}
