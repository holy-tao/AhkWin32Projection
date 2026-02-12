#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include .\CryptographicHash.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IHashAlgorithmProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHashAlgorithmProvider
     * @type {Guid}
     */
    static IID => Guid("{be9b3080-b2c3-422b-bce1-ec90efb5d7b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlgorithmName", "get_HashLength", "HashData", "CreateHash"]

    /**
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
    }

    /**
     * @type {Integer} 
     */
    HashLength {
        get => this.get_HashLength()
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
    get_HashLength() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Hashes an array of data.
     * @param {IBuffer} data 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/shlwapi/nf-shlwapi-hashdata
     */
    HashData(data) {
        result := ComCall(8, this, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {CryptographicHash} 
     */
    CreateHash() {
        result := ComCall(9, this, "ptr*", &Value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicHash(Value)
    }
}
