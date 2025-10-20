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
     * 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {BOOL} fDataIsEncrypted 
     * @returns {HRESULT} 
     */
    SetUser(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(3, this, "ptr", pbData, "uint", cbData, "int", fDataIsEncrypted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @param {BOOL} fDataIsEncrypted 
     * @returns {HRESULT} 
     */
    SetPassword(pbData, cbData, fDataIsEncrypted) {
        result := ComCall(4, this, "ptr", pbData, "uint", cbData, "int", fDataIsEncrypted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbData 
     * @param {Pointer<UInt32>} pcbData 
     * @param {BOOL} fEncryptData 
     * @returns {HRESULT} 
     */
    GetUser(pbData, pcbData, fEncryptData) {
        result := ComCall(5, this, "char*", pbData, "uint*", pcbData, "int", fEncryptData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbData 
     * @param {Pointer<UInt32>} pcbData 
     * @param {BOOL} fEncryptData 
     * @returns {HRESULT} 
     */
    GetPassword(pbData, pcbData, fEncryptData) {
        result := ComCall(6, this, "char*", pbData, "uint*", pcbData, "int", fEncryptData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLoggedOnUser 
     * @returns {HRESULT} 
     */
    LoggedOnUser(pfLoggedOnUser) {
        result := ComCall(7, this, "ptr", pfLoggedOnUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
