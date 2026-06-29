#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Establishes a one-way secure channel between two objects.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsecurechannel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSecureChannel extends IUnknown {
    /**
     * The interface identifier for IMFSecureChannel
     * @type {Guid}
     */
    static IID := Guid("{d0ae555d-3b12-4d97-b060-0990bc5aeb67}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSecureChannel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCertificate : IntPtr
        SetupSession   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSecureChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the client's certificate.
     * @param {Pointer<Pointer<Integer>>} ppCert Receives a pointer to a buffer allocated by the object. The buffer contains the client's certificate. The caller must release the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbCert Receives the size of the <i>ppCert</i> buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsecurechannel-getcertificate
     */
    GetCertificate(ppCert, pcbCert) {
        ppCertMarshal := ppCert is VarRef ? "ptr*" : "ptr"
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppCertMarshal, ppCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }

    /**
     * Passes the encrypted session key to the client.
     * @param {Integer} pbEncryptedSessionKey Pointer to a buffer that contains the encrypted session key. This parameter can be <b>NULL</b>.
     * @param {Integer} cbSessionKey Size of the <i>pbEncryptedSessionKey</i> buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsecurechannel-setupsession
     */
    SetupSession(pbEncryptedSessionKey, cbSessionKey) {
        result := ComCall(4, this, "ptr", pbEncryptedSessionKey, "uint", cbSessionKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSecureChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCertificate := CallbackCreate(GetMethod(implObj, "GetCertificate"), flags, 3)
        this.vtbl.SetupSession := CallbackCreate(GetMethod(implObj, "SetupSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCertificate)
        CallbackFree(this.vtbl.SetupSession)
    }
}
