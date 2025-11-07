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
     * @param {Pointer<Integer>} pcbData 
     * @param {BOOL} fEncryptData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-getuser
     */
    GetUser(pcbData, fEncryptData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "char*", &pbData := 0, pcbDataMarshal, pcbData, "int", fEncryptData, "HRESULT")
        return pbData
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbData 
     * @param {BOOL} fEncryptData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-getpassword
     */
    GetPassword(pcbData, fEncryptData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "char*", &pbData := 0, pcbDataMarshal, pcbData, "int", fEncryptData, "HRESULT")
        return pbData
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredential-loggedonuser
     */
    LoggedOnUser() {
        result := ComCall(7, this, "int*", &pfLoggedOnUser := 0, "HRESULT")
        return pfLoggedOnUser
    }
}
