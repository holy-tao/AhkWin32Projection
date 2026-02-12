#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HashAlgorithmProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IHashAlgorithmProviderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHashAlgorithmProviderStatics
     * @type {Guid}
     */
    static IID => Guid("{9fac9741-5cc4-4336-ae38-6212b75a915a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenAlgorithm"]

    /**
     * 
     * @param {HSTRING} algorithm 
     * @returns {HashAlgorithmProvider} 
     */
    OpenAlgorithm(algorithm) {
        if(algorithm is String) {
            pin := HSTRING.Create(algorithm)
            algorithm := pin.Value
        }
        algorithm := algorithm is Win32Handle ? NumGet(algorithm, "ptr") : algorithm

        result := ComCall(6, this, "ptr", algorithm, "ptr*", &provider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HashAlgorithmProvider(provider)
    }
}
