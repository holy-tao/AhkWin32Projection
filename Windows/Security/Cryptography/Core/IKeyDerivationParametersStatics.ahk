#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KeyDerivationParameters.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IKeyDerivationParametersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationParametersStatics
     * @type {Guid}
     */
    static IID => Guid("{ea961fbe-f37f-4146-9dfe-a456f1735f4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BuildForPbkdf2", "BuildForSP800108", "BuildForSP80056a"]

    /**
     * 
     * @param {IBuffer} pbkdf2Salt 
     * @param {Integer} iterationCount 
     * @returns {KeyDerivationParameters} 
     */
    BuildForPbkdf2(pbkdf2Salt, iterationCount) {
        result := ComCall(6, this, "ptr", pbkdf2Salt, "uint", iterationCount, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyDerivationParameters(value)
    }

    /**
     * 
     * @param {IBuffer} label 
     * @param {IBuffer} context_ 
     * @returns {KeyDerivationParameters} 
     */
    BuildForSP800108(label, context_) {
        result := ComCall(7, this, "ptr", label, "ptr", context_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyDerivationParameters(value)
    }

    /**
     * 
     * @param {IBuffer} algorithmId 
     * @param {IBuffer} partyUInfo 
     * @param {IBuffer} partyVInfo 
     * @param {IBuffer} suppPubInfo 
     * @param {IBuffer} suppPrivInfo 
     * @returns {KeyDerivationParameters} 
     */
    BuildForSP80056a(algorithmId, partyUInfo, partyVInfo, suppPubInfo, suppPrivInfo) {
        result := ComCall(8, this, "ptr", algorithmId, "ptr", partyUInfo, "ptr", partyVInfo, "ptr", suppPubInfo, "ptr", suppPrivInfo, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyDerivationParameters(value)
    }
}
