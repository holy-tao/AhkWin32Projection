#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides a communication channel with the graphics driver or the Microsoft Direct3D runtime.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createauthenticatedchannel">ID3D11VideoDevice::CreateAuthenticatedChannel</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11authenticatedchannel
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11AuthenticatedChannel extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11AuthenticatedChannel
     * @type {Guid}
     */
    static IID := Guid("{3015a308-dcbd-47aa-a747-192486d14d4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11AuthenticatedChannel interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetCertificateSize : IntPtr
        GetCertificate     : IntPtr
        GetChannelHandle   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11AuthenticatedChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the size of the driver's certificate chain. (ID3D11AuthenticatedChannel.GetCertificateSize)
     * @returns {Integer} Receives the size of the certificate chain, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getcertificatesize
     */
    GetCertificateSize() {
        result := ComCall(7, this, "uint*", &pCertificateSize := 0, "HRESULT")
        return pCertificateSize
    }

    /**
     * Gets the driver's certificate chain. (ID3D11AuthenticatedChannel.GetCertificate)
     * @param {Integer} CertificateSize The size of the <i>pCertificate</i> array, in bytes. To get the size of the certificate chain, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11cryptosession-getcertificatesize">ID3D11CryptoSession::GetCertificateSize</a>.
     * @param {Integer} pCertificate A pointer to a byte array that receives the driver's certificate chain. The caller must allocate the array.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getcertificate
     */
    GetCertificate(CertificateSize, pCertificate) {
        result := ComCall(8, this, "uint", CertificateSize, "ptr", pCertificate, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the authenticated channel.
     * @param {Pointer<HANDLE>} pChannelHandle Receives a handle to the channel.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getchannelhandle
     */
    GetChannelHandle(pChannelHandle) {
        ComCall(9, this, HANDLE.Ptr, pChannelHandle)
    }

    Query(iid) {
        if (ID3D11AuthenticatedChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCertificateSize := CallbackCreate(GetMethod(implObj, "GetCertificateSize"), flags, 2)
        this.vtbl.GetCertificate := CallbackCreate(GetMethod(implObj, "GetCertificate"), flags, 3)
        this.vtbl.GetChannelHandle := CallbackCreate(GetMethod(implObj, "GetChannelHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCertificateSize)
        CallbackFree(this.vtbl.GetCertificate)
        CallbackFree(this.vtbl.GetChannelHandle)
    }
}
