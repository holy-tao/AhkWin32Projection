#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by applications to provide user credentials for a network source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcredentialmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCredentialManager extends IUnknown{
    /**
     * The interface identifier for IMFNetCredentialManager
     * @type {Guid}
     */
    static IID => Guid("{5b87ef6b-7ed8-434f-ba0e-184fac1628d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<MFNetCredentialManagerGetParam>} pParam 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pState 
     * @returns {HRESULT} 
     */
    BeginGetCredentials(pParam, pCallback, pState) {
        result := ComCall(3, this, "ptr", pParam, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<IMFNetCredential>} ppCred 
     * @returns {HRESULT} 
     */
    EndGetCredentials(pResult, ppCred) {
        result := ComCall(4, this, "ptr", pResult, "ptr", ppCred, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFNetCredential>} pCred 
     * @param {BOOL} fGood 
     * @returns {HRESULT} 
     */
    SetGood(pCred, fGood) {
        result := ComCall(5, this, "ptr", pCred, "int", fGood, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
