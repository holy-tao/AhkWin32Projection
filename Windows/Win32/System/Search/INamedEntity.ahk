#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to get the value of, or a default phrase for the value of, a named entity.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-inamedentity
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class INamedEntity extends IUnknown{
    /**
     * The interface identifier for INamedEntity
     * @type {Guid}
     */
    static IID => Guid("{abdbd0b1-7d54-49fb-ab5c-bff4130004cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszValue 
     * @returns {HRESULT} 
     */
    GetValue(ppszValue) {
        result := ComCall(3, this, "ptr", ppszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPhrase 
     * @returns {HRESULT} 
     */
    DefaultPhrase(ppszPhrase) {
        result := ComCall(4, this, "ptr", ppszPhrase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
