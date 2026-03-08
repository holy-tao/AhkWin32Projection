#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method to accumulate named entities as identified by an IConditionGenerator object.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-inamedentitycollector
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
     * Adds a single (potential) named entity to this INamedEntityCollector collection, as identified in a tokenized span of the input string being parsed.
     * @remarks
     * When a query parser parses an input string into condition nodes, the parser invokes an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iconditiongenerator">IConditionGenerator</a> object that, in turn, invokes <b>INamedEntityCollector::Add</b> to collect possible named entities in the input string. The <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iconditiongenerator">IConditionGenerator</a> object must call this method for each potential named entity it recognizes in the input string. For each entity, the condition generator must provide the following information: 
     * 
     *         
     * 
     * <ul>
     * <li>what part of the input string it covers</li>
     * <li>the semantic type of the named entity</li>
     * <li>a string representation of the value of the named entity</li>
     * <li>the level of certainty that the input really is that named entity</li>
     * </ul>
     *  
     *         If the named entity was used in the interpretation of the input string, the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditiongenerator-generateforleaf">GenerateForLeaf</a> method of the condition generator will be invoked with the value string as one of the arguments.
     *           
     * 
     * The following relationship must be maintained between the four first arguments: <i>beginSpan</i>  = <i>beginActual</i> &lt; <i>endActual</i> = <i>endSpan</i>.
     * @param {Integer} beginSpan Type: <b>ULONG</b>
     * 
     * The beginning of the overall token span, including any leading quotation marks.
     * @param {Integer} endSpan Type: <b>ULONG</b>
     * 
     * The end of the overall token span including any trailing quotation marks.
     * @param {Integer} beginActual Type: <b>ULONG</b>
     * 
     * The beginning of the part of the token span that identifies the potential named entity.
     * @param {Integer} endActual Type: <b>ULONG</b>
     * 
     * The end of the part of the token span that identifies the potential named entity.
     * @param {IEntity} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>*</b>
     * 
     * The semantic type of the named entity.
     * @param {PWSTR} pszValue Type: <b>LPCWSTR</b>
     * 
     * The name of the entity as a string.
     * @param {Integer} certainty Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-named_entity_certainty">NAMED_ENTITY_CERTAINTY</a></b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentitycollector-add
     */
    Add(beginSpan, endSpan, beginActual, endActual, pType, pszValue, certainty) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(3, this, "uint", beginSpan, "uint", endSpan, "uint", beginActual, "uint", endActual, "ptr", pType, "ptr", pszValue, "int", certainty, "HRESULT")
        return result
    }
}
