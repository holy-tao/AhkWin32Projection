#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for handling named entities and generating special conditions.
 * @remarks
 * 
  * When an object that supports <b>IConditionGenerator</b> has been registered with a query parser as a semantic type T (using the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption">IQueryParser::SetMultiOption</a> method with the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_multioption">SQMO_GENERATOR_FOR_TYPE</a> constant), and that query parser is about to generate a leaf condition node with semantic type T, the query parser first calls the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditiongenerator-generateforleaf">IConditionGenerator::GenerateForLeaf</a> method of the condition generator. If that method returns S_OK, the returned condition tree (which need not be a leaf node) is used. If it returns S_FALSE, then normal processing ia resumed, which generates a leaf node.
  * 
  * A query parser has condition generators preregistered for the known semantic types representing numbers, Booleans, date/time and file paths.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iconditiongenerator
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConditionGenerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionGenerator
     * @type {Guid}
     */
    static IID => Guid("{92d2cc58-4386-45a3-b98c-7e0ce64a4117}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "RecognizeNamedEntities", "GenerateForLeaf", "DefaultPhrase"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ISchemaProvider} pSchemaProvider 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pSchemaProvider) {
        result := ComCall(3, this, "ptr", pSchemaProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszInputString 
     * @param {Integer} lcidUserLocale 
     * @param {ITokenCollection} pTokenCollection 
     * @param {INamedEntityCollector} pNamedEntities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditiongenerator-recognizenamedentities
     */
    RecognizeNamedEntities(pszInputString, lcidUserLocale, pTokenCollection, pNamedEntities) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(4, this, "ptr", pszInputString, "uint", lcidUserLocale, "ptr", pTokenCollection, "ptr", pNamedEntities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IConditionFactory} pConditionFactory 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} cop 
     * @param {PWSTR} pszValueType 
     * @param {PWSTR} pszValue 
     * @param {PWSTR} pszValue2 
     * @param {IRichChunk} pPropertyNameTerm 
     * @param {IRichChunk} pOperationTerm 
     * @param {IRichChunk} pValueTerm 
     * @param {BOOL} automaticWildcard 
     * @param {Pointer<BOOL>} pNoStringQuery 
     * @param {Pointer<ICondition>} ppQueryExpression 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditiongenerator-generateforleaf
     */
    GenerateForLeaf(pConditionFactory, pszPropertyName, cop, pszValueType, pszValue, pszValue2, pPropertyNameTerm, pOperationTerm, pValueTerm, automaticWildcard, pNoStringQuery, ppQueryExpression) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValueType := pszValueType is String ? StrPtr(pszValueType) : pszValueType
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
        pszValue2 := pszValue2 is String ? StrPtr(pszValue2) : pszValue2

        result := ComCall(5, this, "ptr", pConditionFactory, "ptr", pszPropertyName, "int", cop, "ptr", pszValueType, "ptr", pszValue, "ptr", pszValue2, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", automaticWildcard, "ptr", pNoStringQuery, "ptr*", ppQueryExpression, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValueType 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @param {BOOL} fUseEnglish 
     * @param {Pointer<PWSTR>} ppszPhrase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditiongenerator-defaultphrase
     */
    DefaultPhrase(pszValueType, ppropvar, fUseEnglish, ppszPhrase) {
        pszValueType := pszValueType is String ? StrPtr(pszValueType) : pszValueType

        result := ComCall(6, this, "ptr", pszValueType, "ptr", ppropvar, "int", fUseEnglish, "ptr", ppszPhrase, "HRESULT")
        return result
    }
}
