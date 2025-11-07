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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue", "DefaultPhrase"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentity-getvalue
     */
    GetValue() {
        result := ComCall(3, this, "ptr*", &ppszValue := 0, "HRESULT")
        return ppszValue
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentity-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(4, this, "ptr*", &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }
}
