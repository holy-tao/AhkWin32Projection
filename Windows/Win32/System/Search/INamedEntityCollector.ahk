#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEntity.ahk" { IEntity }
#Import ".\NAMED_ENTITY_CERTAINTY.ahk" { NAMED_ENTITY_CERTAINTY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to accumulate named entities as identified by an IConditionGenerator object.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-inamedentitycollector
 * @namespace Windows.Win32.System.Search
 */
export default struct INamedEntityCollector extends IUnknown {
    /**
     * The interface identifier for INamedEntityCollector
     * @type {Guid}
     */
    static IID := Guid("{af2440f6-8afc-47d0-9a7f-396a0acfb43d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INamedEntityCollector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INamedEntityCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {NAMED_ENTITY_CERTAINTY} certainty Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-named_entity_certainty">NAMED_ENTITY_CERTAINTY</a></b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-inamedentitycollector-add
     */
    Add(beginSpan, endSpan, beginActual, endActual, pType, pszValue, certainty) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(3, this, "uint", beginSpan, "uint", endSpan, "uint", beginActual, "uint", endActual, "ptr", pType, "ptr", pszValue, NAMED_ENTITY_CERTAINTY, certainty, "HRESULT")
        return result
    }

    Query(iid) {
        if (INamedEntityCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
    }
}
