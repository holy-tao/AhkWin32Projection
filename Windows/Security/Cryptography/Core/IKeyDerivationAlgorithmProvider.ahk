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
class IKeyDerivationAlgorithmProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationAlgorithmProvider
     * @type {Guid}
     */
    static IID => Guid("{e1fba83b-4671-43b7-9158-763aaa98b6bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlgorithmName", "CreateKey"]

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
     * @param {IBuffer} keyMaterial 
     * @returns {CryptographicKey} 
     */
    CreateKey(keyMaterial) {
        result := ComCall(7, this, "ptr", keyMaterial, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }
}
