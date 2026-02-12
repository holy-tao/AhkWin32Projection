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
class IAsymmetricKeyAlgorithmProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsymmetricKeyAlgorithmProvider2
     * @type {Guid}
     */
    static IID => Guid("{4e322a7e-7c4d-4997-ac4f-1b848b36306e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateKeyPairWithCurveName", "CreateKeyPairWithCurveParameters"]

    /**
     * 
     * @param {HSTRING} curveName 
     * @returns {CryptographicKey} 
     */
    CreateKeyPairWithCurveName(curveName) {
        if(curveName is String) {
            pin := HSTRING.Create(curveName)
            curveName := pin.Value
        }
        curveName := curveName is Win32Handle ? NumGet(curveName, "ptr") : curveName

        result := ComCall(6, this, "ptr", curveName, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }

    /**
     * 
     * @param {Integer} parameters_length 
     * @param {Pointer<Integer>} parameters 
     * @returns {CryptographicKey} 
     */
    CreateKeyPairWithCurveParameters(parameters_length, parameters) {
        parametersMarshal := parameters is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", parameters_length, parametersMarshal, parameters, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CryptographicKey(key)
    }
}
