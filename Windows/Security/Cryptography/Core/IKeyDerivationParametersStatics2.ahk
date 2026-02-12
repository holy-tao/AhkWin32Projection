#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KeyDerivationParameters.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IKeyDerivationParametersStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationParametersStatics2
     * @type {Guid}
     */
    static IID => Guid("{a5783dd5-58e3-4efb-b283-a1653126e1be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BuildForCapi1Kdf"]

    /**
     * 
     * @param {Integer} capi1KdfTargetAlgorithm_ 
     * @returns {KeyDerivationParameters} 
     */
    BuildForCapi1Kdf(capi1KdfTargetAlgorithm_) {
        result := ComCall(6, this, "int", capi1KdfTargetAlgorithm_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyDerivationParameters(value)
    }
}
