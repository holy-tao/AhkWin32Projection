#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\KeyCredentialOperationResult.ahk
#Include .\KeyCredentialAttestationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IKeyCredential extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyCredential
     * @type {Guid}
     */
    static IID => Guid("{9585ef8d-457b-4847-b11a-fa960bbdb138}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "RetrievePublicKeyWithDefaultBlobType", "RetrievePublicKeyWithBlobType", "RequestSignAsync", "GetAttestationAsync"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    RetrievePublicKeyWithDefaultBlobType() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {Integer} blobType 
     * @returns {IBuffer} 
     */
    RetrievePublicKeyWithBlobType(blobType) {
        result := ComCall(8, this, "int", blobType, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<KeyCredentialOperationResult>} 
     */
    RequestSignAsync(data) {
        result := ComCall(9, this, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialOperationResult, value)
    }

    /**
     * 
     * @returns {IAsyncOperation<KeyCredentialAttestationResult>} 
     */
    GetAttestationAsync() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialAttestationResult, value)
    }
}
