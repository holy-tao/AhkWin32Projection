#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class ICryptographicEngineStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICryptographicEngineStatics2
     * @type {Guid}
     */
    static IID => Guid("{675948fe-df9f-4191-92c7-6ce6f58420e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SignHashedData", "VerifySignatureWithHashInput", "DecryptAsync", "SignAsync", "SignHashedDataAsync"]

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @returns {IBuffer} 
     */
    SignHashedData(key, data) {
        result := ComCall(6, this, "ptr", key, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} signature 
     * @returns {Boolean} 
     */
    VerifySignatureWithHashInput(key, data, signature) {
        result := ComCall(7, this, "ptr", key, "ptr", data, "ptr", signature, "int*", &isAuthenticated := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isAuthenticated
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @param {IBuffer} iv 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    DecryptAsync(key, data, iv) {
        result := ComCall(8, this, "ptr", key, "ptr", data, "ptr", iv, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, value)
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    SignAsync(key, data) {
        result := ComCall(9, this, "ptr", key, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, value)
    }

    /**
     * 
     * @param {CryptographicKey} key 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    SignHashedDataAsync(key, data) {
        result := ComCall(10, this, "ptr", key, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, value)
    }
}
