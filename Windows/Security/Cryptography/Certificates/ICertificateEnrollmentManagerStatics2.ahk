#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UserCertificateEnrollmentManager.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateEnrollmentManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateEnrollmentManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{dc5b1c33-6429-4014-999c-5d9735802d1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserCertificateEnrollmentManager", "ImportPfxDataToKspAsync"]

    /**
     * @type {UserCertificateEnrollmentManager} 
     */
    UserCertificateEnrollmentManager {
        get => this.get_UserCertificateEnrollmentManager()
    }

    /**
     * 
     * @returns {UserCertificateEnrollmentManager} 
     */
    get_UserCertificateEnrollmentManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserCertificateEnrollmentManager(value)
    }

    /**
     * 
     * @param {HSTRING} pfxData 
     * @param {HSTRING} password 
     * @param {Integer} exportable 
     * @param {Integer} keyProtectionLevel_ 
     * @param {Integer} installOption 
     * @param {HSTRING} friendlyName 
     * @param {HSTRING} keyStorageProvider 
     * @returns {IAsyncAction} 
     */
    ImportPfxDataToKspAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName, keyStorageProvider) {
        if(pfxData is String) {
            pin := HSTRING.Create(pfxData)
            pfxData := pin.Value
        }
        pfxData := pfxData is Win32Handle ? NumGet(pfxData, "ptr") : pfxData
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password
        if(friendlyName is String) {
            pin := HSTRING.Create(friendlyName)
            friendlyName := pin.Value
        }
        friendlyName := friendlyName is Win32Handle ? NumGet(friendlyName, "ptr") : friendlyName
        if(keyStorageProvider is String) {
            pin := HSTRING.Create(keyStorageProvider)
            keyStorageProvider := pin.Value
        }
        keyStorageProvider := keyStorageProvider is Win32Handle ? NumGet(keyStorageProvider, "ptr") : keyStorageProvider

        result := ComCall(7, this, "ptr", pfxData, "ptr", password, "int", exportable, "int", keyProtectionLevel_, "uint", installOption, "ptr", friendlyName, "ptr", keyStorageProvider, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }
}
