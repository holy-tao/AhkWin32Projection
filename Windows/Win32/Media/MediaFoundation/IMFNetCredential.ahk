#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets and retrieves user-name and password information for authentication purposes.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcredential
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCredential extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetCredential
     * @type {Guid}
     */
    static IID => Guid("{5b87ef6a-7ed8-434f-ba0e-184fac1628d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUser", "SetPassword", "GetUser", "GetPassword", "LoggedOnUser"]

    /**
     * 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {BOOL} fDataIsEncrypted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-setuser
     */
    SetUser(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(3, this, "ptr", pbData, "uint", cbData, "int", fDataIsEncrypted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {BOOL} fDataIsEncrypted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-setpassword
     */
    SetPassword(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(4, this, "ptr", pbData, "uint", cbData, "int", fDataIsEncrypted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Pointer<Integer>} pcbData 
     * @param {BOOL} fEncryptData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-getuser
     */
    GetUser(pbData, pcbData, fEncryptData) {
        result := ComCall(5, this, "char*", pbData, "uint*", pcbData, "int", fEncryptData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Pointer<Integer>} pcbData 
     * @param {BOOL} fEncryptData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-getpassword
     */
    GetPassword(pbData, pcbData, fEncryptData) {
        result := ComCall(6, this, "char*", pbData, "uint*", pcbData, "int", fEncryptData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLoggedOnUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-loggedonuser
     */
    LoggedOnUser(pfLoggedOnUser) {
        result := ComCall(7, this, "ptr", pfLoggedOnUser, "HRESULT")
        return result
    }
}
