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
     * 
     * @param {Pointer<Byte>} ppCert 
     * @param {Pointer<UInt32>} pcbCert 
     * @returns {HRESULT} 
     */
    GetCertificate(ppCert, pcbCert) {
        result := ComCall(3, this, "char*", ppCert, "uint*", pcbCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pbEncryptedSessionKey 
     * @param {Integer} cbSessionKey 
     * @returns {HRESULT} 
     */
    SetupSession(pbEncryptedSessionKey, cbSessionKey) {
        result := ComCall(4, this, "ptr", pbEncryptedSessionKey, "uint", cbSessionKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
