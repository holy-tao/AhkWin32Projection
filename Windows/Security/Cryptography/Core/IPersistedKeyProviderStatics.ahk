#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\CryptographicKey.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IPersistedKeyProviderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistedKeyProviderStatics
     * @type {Guid}
     */
    static IID => Guid("{77274814-d9d4-4cf5-b668-e0457df30894}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenKeyPairFromCertificateAsync", "OpenPublicKeyFromCertificate"]

    /**
     * 
     * @param {Certificate} certificate_ 
     * @param {HSTRING} hashAlgorithmName 
     * @param {Integer} padding 
     * @returns {IAsyncOperation<CryptographicKey>} 
     */
    OpenKeyPairFromCertificateAsync(certificate_, hashAlgorithmName, padding) {
        if(hashAlgorithmName is String) {
            pin := HSTRING.Create(hashAlgorithmName)
            hashAlgorithmName := pin.Value
        }
        hashAlgorithmName := hashAlgorithmName is Win32Handle ? NumGet(hashAlgorithmName, "ptr") : hashAlgorithmName

        result := ComCall(6, this, "ptr", certificate_, "ptr", hashAlgorithmName, "int", padding, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CryptographicKey, operation)
    }

    /**
     * 
     * @param {Certificate} certificate_ 
     * @param {HSTRING} hashAlgorithmName 
     * @param {Integer} padding 
     * @returns {CryptographicKey} 
     */
    OpenPublicKeyFromCertificate(certificate_, hashAlgorithmName, padding) {
        if(hashAlgorithmName is String) {
            pin := HSTRING.Create(hashAlgorithmName)
            hashAlgorithmName := pin.Value
        }
        hashAlgorithmName := hashAlgorithmName is Win32Handle ? NumGet(hashAlgorithmName, "ptr") : hashAlgorithmName

        result := ComCall(7, this, "ptr", certificate_, "ptr", hashAlgorithmName, "int", padding, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }
}
