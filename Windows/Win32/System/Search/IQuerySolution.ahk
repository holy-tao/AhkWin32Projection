#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICondition.ahk" { ICondition }
#Import ".\IConditionFactory.ahk" { IConditionFactory }
#Import ".\IEntity.ahk" { IEntity }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITokenCollection.ahk" { ITokenCollection }

/**
 * Provides methods that retrieve information about the interpretation of a parsed query.
 * @remarks
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-iquerysolution
 * @namespace Windows.Win32.System.Search
 */
export default struct IQuerySolution extends IConditionFactory {
    /**
     * The interface identifier for IQuerySolution
     * @type {Guid}
     */
    static IID := Guid("{d6ebc66b-8921-4193-afdd-a1789fb7ff57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQuerySolution interfaces
    */
    struct Vtbl extends IConditionFactory.Vtbl {
        GetQuery       : IntPtr
        GetErrors      : IntPtr
        GetLexicalData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQuerySolution.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the condition tree and the semantic type of the solution.
     * @param {Pointer<ICondition>} ppQueryNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> condition tree that is the interpretation of the query string. This parameter can be <b>NULL</b>.
     * @param {Pointer<IEntity>} ppMainType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object that identifies the semantic type of the interpretation. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iquerysolution-getquery
     */
    GetQuery(ppQueryNode, ppMainType) {
        result := ComCall(7, this, ICondition.Ptr, ppQueryNode, IEntity.Ptr, ppMainType, "HRESULT")
        return result
    }

    /**
     * Identifies parts of the input string that the parser did not recognize or did not use when constructing the IQuerySolution condition tree.
     * @remarks
     * Each parsing error is represented by an <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_parse_error">IRichChunk</a> object in which the position information reflects token counts. The <b>IRichChunk</b> object <i>ppsz</i> string is <b>NULL</b>, and the <i>pValue</i> is a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> that contains a <b>lVal</b> identifying the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_parse_error">STRUCTURED_QUERY_PARSE_ERROR</a> enumeration.
     *       
     * 
     * The valid values for <i>riid</i> are __uuidof(IEnumUnknown) and __uuidof(IEnumVARIANT).
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to an enumeration of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> objects, each describing one parsing error.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iquerysolution-geterrors
     */
    GetErrors(riid) {
        result := ComCall(8, this, Guid.Ptr, riid, "ptr*", &ppParseErrors := 0, "HRESULT")
        return ppParseErrors
    }

    /**
     * Reports the query string, how it was tokenized, and what language code identifier (LCID) and word breaker were used to parse it.
     * @param {Pointer<PWSTR>} ppszInputString Type: <b>LPWSTR*</b>
     * 
     * Receives the query string. This parameter can be <b>NULL</b>.
     * @param {Pointer<ITokenCollection>} ppTokens Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a> object that describes how the query was tokenized. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} plcid Type: <b>LCID*</b>
     * 
     * Receives a LCID for the word breaker used for this query. This parameter can be <b>NULL</b>.
     * @param {Pointer<IUnknown>} ppWordBreaker Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to the word breaker used for this query. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iquerysolution-getlexicaldata
     */
    GetLexicalData(ppszInputString, ppTokens, plcid, ppWordBreaker) {
        ppszInputStringMarshal := ppszInputString is VarRef ? "ptr*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, ppszInputStringMarshal, ppszInputString, ITokenCollection.Ptr, ppTokens, plcidMarshal, plcid, IUnknown.Ptr, ppWordBreaker, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQuerySolution.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetQuery := CallbackCreate(GetMethod(implObj, "GetQuery"), flags, 3)
        this.vtbl.GetErrors := CallbackCreate(GetMethod(implObj, "GetErrors"), flags, 3)
        this.vtbl.GetLexicalData := CallbackCreate(GetMethod(implObj, "GetLexicalData"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetQuery)
        CallbackFree(this.vtbl.GetErrors)
        CallbackFree(this.vtbl.GetLexicalData)
    }
}
