#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IKeyAttestationHelperStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyAttestationHelperStatics2
     * @type {Guid}
     */
    static IID => Guid("{9c590b2c-a6c6-4a5e-9e64-e85d5279df97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecryptTpmAttestationCredentialWithContainerNameAsync"]

    /**
     * 
     * @param {HSTRING} credential 
     * @param {HSTRING} containerName 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    DecryptTpmAttestationCredentialWithContainerNameAsync(credential, containerName) {
        if(credential is String) {
            pin := HSTRING.Create(credential)
            credential := pin.Value
        }
        credential := credential is Win32Handle ? NumGet(credential, "ptr") : credential
        if(containerName is String) {
            pin := HSTRING.Create(containerName)
            containerName := pin.Value
        }
        containerName := containerName is Win32Handle ? NumGet(containerName, "ptr") : containerName

        result := ComCall(6, this, "ptr", credential, "ptr", containerName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), value)
    }
}
