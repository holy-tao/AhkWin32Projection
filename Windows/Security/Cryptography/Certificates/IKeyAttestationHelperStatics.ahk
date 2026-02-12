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
class IKeyAttestationHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyAttestationHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{1648e246-f644-4326-88be-3af102d30e0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecryptTpmAttestationCredentialAsync", "GetTpmAttestationCredentialId"]

    /**
     * 
     * @param {HSTRING} credential 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    DecryptTpmAttestationCredentialAsync(credential) {
        if(credential is String) {
            pin := HSTRING.Create(credential)
            credential := pin.Value
        }
        credential := credential is Win32Handle ? NumGet(credential, "ptr") : credential

        result := ComCall(6, this, "ptr", credential, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {HSTRING} credential 
     * @returns {HSTRING} 
     */
    GetTpmAttestationCredentialId(credential) {
        if(credential is String) {
            pin := HSTRING.Create(credential)
            credential := pin.Value
        }
        credential := credential is Win32Handle ? NumGet(credential, "ptr") : credential

        value := HSTRING()
        result := ComCall(7, this, "ptr", credential, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
