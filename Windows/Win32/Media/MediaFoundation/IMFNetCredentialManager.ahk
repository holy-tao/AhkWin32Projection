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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginGetCredentials", "EndGetCredentials", "SetGood"]

    /**
     * 
     * @param {Pointer<MFNetCredentialManagerGetParam>} pParam 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialmanager-begingetcredentials
     */
    BeginGetCredentials(pParam, pCallback, pState) {
        result := ComCall(3, this, "ptr", pParam, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<IMFNetCredential>} ppCred 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialmanager-endgetcredentials
     */
    EndGetCredentials(pResult, ppCred) {
        result := ComCall(4, this, "ptr", pResult, "ptr*", ppCred, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFNetCredential} pCred 
     * @param {BOOL} fGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialmanager-setgood
     */
    SetGood(pCred, fGood) {
        result := ComCall(5, this, "ptr", pCred, "int", fGood, "HRESULT")
        return result
    }
}
