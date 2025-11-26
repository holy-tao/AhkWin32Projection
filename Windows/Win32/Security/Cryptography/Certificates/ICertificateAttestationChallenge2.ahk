#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertificateAttestationChallenge.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertificateAttestationChallenge2 extends ICertificateAttestationChallenge{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateAttestationChallenge2
     * @type {Guid}
     */
    static IID => Guid("{4631334d-e266-47d6-bd79-be53cb2e2753}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_KeyContainerName", "put_KeyBlob"]

    /**
     * @type {HRESULT} 
     */
    KeyContainerName {
        set => this.put_KeyContainerName(value)
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_KeyContainerName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(10, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_KeyBlob(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(11, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }
}
