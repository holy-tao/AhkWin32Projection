#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CryptographicKey.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IAsymmetricKeyAlgorithmProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsymmetricKeyAlgorithmProvider
     * @type {Guid}
     */
    static IID => Guid("{e8d2ff37-6259-4e88-b7e0-94191fde699e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlgorithmName", "CreateKeyPair", "ImportDefaultPrivateKeyBlob", "ImportKeyPairWithBlobType", "ImportDefaultPublicKeyBlob", "ImportPublicKeyWithBlobType"]

    /**
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlgorithmName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} keySize_ 
     * @returns {CryptographicKey} 
     */
    CreateKeyPair(keySize_) {
        result := ComCall(7, this, "uint", keySize_, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }

    /**
     * 
     * @param {IBuffer} keyBlob 
     * @returns {CryptographicKey} 
     */
    ImportDefaultPrivateKeyBlob(keyBlob) {
        result := ComCall(8, this, "ptr", keyBlob, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }

    /**
     * 
     * @param {IBuffer} keyBlob 
     * @param {Integer} BlobType 
     * @returns {CryptographicKey} 
     */
    ImportKeyPairWithBlobType(keyBlob, BlobType) {
        result := ComCall(9, this, "ptr", keyBlob, "int", BlobType, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }

    /**
     * 
     * @param {IBuffer} keyBlob 
     * @returns {CryptographicKey} 
     */
    ImportDefaultPublicKeyBlob(keyBlob) {
        result := ComCall(10, this, "ptr", keyBlob, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }

    /**
     * 
     * @param {IBuffer} keyBlob 
     * @param {Integer} BlobType 
     * @returns {CryptographicKey} 
     */
    ImportPublicKeyWithBlobType(keyBlob, BlobType) {
        result := ComCall(11, this, "ptr", keyBlob, "int", BlobType, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }
}
