#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Establishes a one-way secure channel between two objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsecurechannel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSecureChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSecureChannel
     * @type {Guid}
     */
    static IID => Guid("{d0ae555d-3b12-4d97-b060-0990bc5aeb67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCertificate", "SetupSession"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppCert 
     * @param {Pointer<Integer>} pcbCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsecurechannel-getcertificate
     */
    GetCertificate(ppCert, pcbCert) {
        ppCertMarshal := ppCert is VarRef ? "ptr*" : "ptr"
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppCertMarshal, ppCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbEncryptedSessionKey 
     * @param {Integer} cbSessionKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsecurechannel-setupsession
     */
    SetupSession(pbEncryptedSessionKey, cbSessionKey) {
        result := ComCall(4, this, "ptr", pbEncryptedSessionKey, "uint", cbSessionKey, "HRESULT")
        return result
    }
}
