#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CryptographicHash.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IMacAlgorithmProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMacAlgorithmProvider2
     * @type {Guid}
     */
    static IID => Guid("{6da32a15-d931-42ed-8e7e-c301caee119c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateHash"]

    /**
     * 
     * @param {IBuffer} keyMaterial 
     * @returns {CryptographicHash} 
     */
    CreateHash(keyMaterial) {
        result := ComCall(6, this, "ptr", keyMaterial, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicHash(value)
    }
}
