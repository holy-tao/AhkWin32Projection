#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method to accumulate named entities as identified by an IConditionGenerator object.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-inamedentitycollector
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class INamedEntityCollector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedEntityCollector
     * @type {Guid}
     */
    static IID => Guid("{af2440f6-8afc-47d0-9a7f-396a0acfb43d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add"]

    /**
     * 
     * @param {Integer} beginSpan 
     * @param {Integer} endSpan 
     * @param {Integer} beginActual 
     * @param {Integer} endActual 
     * @param {IEntity} pType 
     * @param {PWSTR} pszValue 
     * @param {Integer} certainty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentitycollector-add
     */
    Add(beginSpan, endSpan, beginActual, endActual, pType, pszValue, certainty) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(3, this, "uint", beginSpan, "uint", endSpan, "uint", beginActual, "uint", endActual, "ptr", pType, "ptr", pszValue, "int", certainty, "HRESULT")
        return result
    }
}
