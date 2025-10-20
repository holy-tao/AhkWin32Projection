#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechObjectTokens extends IDispatch{
    /**
     * The interface identifier for ISpeechObjectTokens
     * @type {Guid}
     */
    static IID => Guid("{9285b776-2e7b-4bc0-b53e-580eb6fa967f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ISpeechObjectToken>} Token 
     * @returns {HRESULT} 
     */
    Item(Index, Token) {
        result := ComCall(8, this, "int", Index, "ptr", Token, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumVARIANT 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnumVARIANT) {
        result := ComCall(9, this, "ptr", ppEnumVARIANT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
