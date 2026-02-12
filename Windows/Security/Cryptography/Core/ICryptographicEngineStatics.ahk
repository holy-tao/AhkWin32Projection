#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include .\EncryptedAndAuthenticatedData.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class ICryptographicEngineStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICryptographicEngineStatics
     * @type {Guid}
     */
    static IID => Guid("{9fea0639-6ff7-4c85-a095-95eb31715eb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Encrypt", "Decrypt", "EncryptAndAuthenticate", "DecryptAndAuthenticate", "Sign", "VerifySignature", "DeriveKeyMaterial"]

    /**
     * Begins encryption of a fully decrypted volume, or resumes encryption of a partially encrypted volume.
     * @remarks
     * When you use this method without the second optional parameter (according to the Windows 7 and Windows Vista Enterprise definition), the method will always initiate full mode conversion in order to keep backward compatible behavior. This way the security expectation of existing applications and scripts will not be broken with the addition of the second optional parameter in Windows 8 and Windows Server 2012.
     * 
     * You can call [**GetConversionStatus**](getconversionstatus-win32-encryptablevolume.md) to determine whether encryption is in progress and the percentage of the volume that has been encrypted.
     * 
     * After the volume is fully encrypted and if key protectors have been added and enabled, the protection status for the volume changes to "on".
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} iv 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/encrypt-win32-encryptablevolume
     */
    Encrypt(key, data, iv) {
        result := ComCall(6, this, "ptr", key, "ptr", data, "ptr", iv, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * Begins decryption of a fully encrypted volume, or resumes decryption of a partially encrypted volume.
     * @remarks
     * If the volume is not already fully decrypted, running **Decrypt** causes [**GetConversionStatus**](getconversionstatus-win32-encryptablevolume.md) to indicate that decryption is progress and shows the percentage of the volume that remains encrypted.
     * 
     * If the protection status of the volume is "on" before this method is run, running this method changes the protection status to "off", since by definition a partially encrypted volume is not protected.
     * 
     * If this method is run on the currently running operating system volume and this operating system volume is being used to automatically unlock data volumes (see method [**EnableAutoUnlock**](enableautounlock-win32-encryptablevolume.md)) you must first call the method [**ClearAllAutoUnlockKeys**](clearallautounlockkeys-win32-encryptablevolume.md).
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} iv 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/decrypt-win32-encryptablevolume
     */
    Decrypt(key, data, iv) {
        result := ComCall(7, this, "ptr", key, "ptr", data, "ptr", iv, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} nonce 
     * @param {IBuffer} authenticatedData 
     * @returns {EncryptedAndAuthenticatedData} 
     */
    EncryptAndAuthenticate(key, data, nonce, authenticatedData) {
        result := ComCall(8, this, "ptr", key, "ptr", data, "ptr", nonce, "ptr", authenticatedData, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EncryptedAndAuthenticatedData(value)
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} nonce 
     * @param {IBuffer} authenticationTag 
     * @param {IBuffer} authenticatedData 
     * @returns {IBuffer} 
     */
    DecryptAndAuthenticate(key, data, nonce, authenticationTag, authenticatedData) {
        result := ComCall(9, this, "ptr", key, "ptr", data, "ptr", nonce, "ptr", authenticationTag, "ptr", authenticatedData, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * Returns the positive (+1), zero (0), or negative (-1) sign of the specified expression.
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/access/sign-function-access-custom-web-app
     */
    Sign(key, data) {
        result := ComCall(10, this, "ptr", key, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * Verifies that a message signed by using the MakeSignature function was received in the correct sequence and has not been modified.
     * @remarks
     * <div class="alert"><b>Warning</b>  <p class="note">The <b>VerifySignature</b> function will fail if the message was signed using the <a href="https://docs.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha512">RsaSignPssSha512</a> algorithm on a different version of Windows. For example, a message that was signed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function on Windows 8 will cause the <b>VerifySignature</b> function on Windows 8.1 to fail.
     * 
     * </div>
     * <div> </div>
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} signature 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-verifysignature
     */
    VerifySignature(key, data, signature) {
        result := ComCall(11, this, "ptr", key, "ptr", data, "ptr", signature, "int*", &isAuthenticated := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isAuthenticated
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {KeyDerivationParameters} parameters 
     * @param {Integer} desiredKeySize 
     * @returns {IBuffer} 
     */
    DeriveKeyMaterial(key, parameters, desiredKeySize) {
        result := ComCall(12, this, "ptr", key, "ptr", parameters, "uint", desiredKeySize, "ptr*", &keyMaterial := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(keyMaterial)
    }
}
