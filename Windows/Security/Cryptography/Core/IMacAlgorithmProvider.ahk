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
class IMacAlgorithmProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMacAlgorithmProvider
     * @type {Guid}
     */
    static IID => Guid("{4a3fc5c3-1cbd-41ce-a092-aa0bc5d2d2f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlgorithmName", "get_MacLength", "CreateKey"]

    /**
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
    }

    /**
     * @type {Integer} 
     */
    MacLength {
        get => this.get_MacLength()
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
     * @returns {Integer} 
     */
    get_MacLength() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
        result := ComCall(8, this, "ptr", keyMaterial, "ptr*", &macKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(macKey)
    }
}
